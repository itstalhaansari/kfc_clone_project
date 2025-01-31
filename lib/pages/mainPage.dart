import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kfc_project/colors.dart';
import 'package:kfc_project/images.dart';
import 'package:kfc_project/dimensions.dart';
import 'package:kfc_project/pages/menuPage.dart';
import 'package:kfc_project/spacing.dart';
import 'package:kfc_project/widget/KFC_Box.dart';
import 'package:kfc_project/widget/brand_divider.dart';
import 'package:kfc_project/data.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  var db = FirebaseFirestore.instance;

  late Future firebaseFuture;

  List<Map<String, dynamic>> categoriesList = [];

  Future<void> fetchDataFromFirebase() async {
    var categoriesData = await db
        .collection("categories")
        .orderBy("priority")
        .limit(5)
        .where("priority", isGreaterThan: 0)
        .get();
    categoriesList = categoriesData.docs.map((doc) => doc.data()).toList();
  }

  String cardColor = "${AppColor.lightCardColor}";

  @override
  void initState() {
    super.initState();
    firebaseFuture = fetchDataFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 2.8 / 1,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: 1.0),
            items: Images.slideImages.map((String imagePath) {
              return Image.asset(
                imagePath,
                fit: BoxFit.cover,
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimension.paddingBody),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "EXPLORE MENU",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: AppColor.lightText),
                    ),
                    const Spacer(),
                    TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return const menuPage();
                            },
                          ));
                        },
                        child: Text(
                          "VIEW ALL",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppColor.lightText),
                        )),
                  ],
                ),
                const brand_divider(),
                spacing.smallY,
                FutureBuilder(
                  future: firebaseFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return StaggeredGrid.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: Dimension.spacingSmall,
                        mainAxisSpacing: Dimension.spacingSmall,
                        children: categoriesList.map(
                          (menuItem) {
                            return StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount:
                                  menuItem["title"] == "Everyday Value" ? 2 : 1,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return menuPage(
                                        categoryName:
                                            menuItem["title"].toString(),
                                      );
                                    },
                                  ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(
                                      Dimension.paddingSmall),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(
                                        Dimension.borderRadiusSmall),
                                    color: Theme.of(context)
                                        .cardTheme
                                        .color, // Automatically adjusts to theme
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        menuItem["title"]!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      Expanded(
                                          child: Image.network(
                                        menuItem["image"]!,
                                        fit: BoxFit.fitWidth,
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      );
                    } else {
                      return const Center(
                        child: Text("No Data available!"),
                      );
                    }
                  },
                ),
                spacing.mediumY,
                Text(
                  "BEST SELLERS",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColor.lightText),
                ),
                const brand_divider(),
                spacing.mediumY,
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                    itemCount: bestSeller.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        child: SizedBox(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const kfcBox(),
                              Padding(
                                padding: const EdgeInsets.all(
                                    Dimension.paddingMedium),
                                child: Text(
                                  bestSeller[index]["name"]!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 20),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Dimension.paddingLarge,
                                      vertical: Dimension.paddingSmall * 0.5),
                                  color: AppColor.brandColor,
                                  child: Text(
                                    "Rs ${bestSeller[index]["price"]!}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                    child: Image.asset(
                                  bestSeller[index]["image"]!,
                                  fit: BoxFit.fitWidth,
                                )),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                spacing.mediumY,
                Text(
                  "TOP DEALS",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const brand_divider(),
                SizedBox(
                  height: 360,
                  child: ListView.builder(
                    itemCount: topDeals.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          SizedBox(
                            height: 328,
                            child: Card(
                              child: SizedBox(
                                width: 200,
                                child: Column(
                                  children: [
                                    const kfcBox(),
                                    Expanded(
                                        child: Center(
                                            child: Image.asset(
                                      topDeals[index]["image"]!,
                                      fit: BoxFit.fitHeight,
                                    ))),
                                    Padding(
                                      padding: const EdgeInsets.all(
                                          Dimension.paddingSmall),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            topDeals[index]["name"]!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(fontSize: 20),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(topDeals[index]["description"]!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
                                          Text(
                                            "Rs ${topDeals[index]["price"]}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                          const SizedBox(
                                            height:
                                                Dimension.spacingSmall * 1.5,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 304,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimension.borderRadiusSmall))),
                              onPressed: () {
                                SnackBar sb = const SnackBar(
                                  content: Text(
                                    "Under Development",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.green,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(sb);
                              },
                              label: const Text("ADD TO BUCKET"),
                              icon: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                spacing.mediumY,
                ClipRRect(
                    borderRadius:
                        BorderRadius.circular(Dimension.borderRadiusSmall),
                    child: Image.asset(Images.homeOne)),
                spacing.mediumY,
                ClipRRect(
                    borderRadius:
                        BorderRadius.circular(Dimension.borderRadiusSmall),
                    child: Image.asset(Images.homeTwo))
              ],
            ),
          )
        ],
      ),
    );
  }
}
