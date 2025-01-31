import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kfc_project/colors.dart';
import 'package:kfc_project/dimensions.dart';
import 'package:kfc_project/widget/my_appBar.dart';
import 'package:provider/provider.dart';
import 'package:kfc_project/providers/cart_provider.dart';

class menuPage extends StatefulWidget {
  final String categoryName;

  const menuPage({super.key, this.categoryName = "All"});

  @override
  State<menuPage> createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  int selectedCategoryIndex = 0;

  var db = FirebaseFirestore.instance;

  late Future<void> FirebaseFuture;

  List<String> categories = [];

  List<Map<String, dynamic>> products = [];

  Future<void> getCategoryFromFirebase() async {
    var categoriesData =
        await db.collection("categories").orderBy("priority").get();

    categories =
        categoriesData.docs.map((doc) => doc["title"].toString()).toList();

    var productData = await db.collection("products").get();

    products = productData.docs.map((doc) => doc.data()).toList();

    setState(() {
      selectedCategoryIndex = categories.indexOf(widget.categoryName);
    });
  }

  List<String> getFilteredCategories() {
    List<String> filteredCategories = [];

    if (categories.isNotEmpty) {
      if (selectedCategoryIndex == 0) {
        filteredCategories = categories.getRange(1, categories.length).toList();
      } else {
        filteredCategories.clear();
        filteredCategories.add(categories[selectedCategoryIndex]);
      }
    }
    return filteredCategories;
  }

  @override
  void initState() {
    super.initState();
    FirebaseFuture = getCategoryFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredCategories = getFilteredCategories();
    return Scaffold(
      appBar: const CustomAppBar(),
      body: FutureBuilder(
        future: FirebaseFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                // Categories List
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 12),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: selectedCategoryIndex == index
                                ? AppColor.brandColor
                                : Theme.of(context).cardTheme.color,
                            borderRadius: BorderRadius.circular(
                                Dimension.borderRadiusSmall),
                          ),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: selectedCategoryIndex == index
                                        ? Colors.white
                                        : null,
                                  ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Products List
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredCategories.length,
                    itemBuilder: (context, index) {
                      List<Map<String, dynamic>> filteredProduct = products
                          .where(
                            (element) =>
                                element["category"] ==
                                filteredCategories[index],
                          )
                          .toList();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Category Title
                          Visibility(
                            visible: filteredCategories.length > 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(Dimension.paddingSmall),
                              child: Text(
                                filteredCategories[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        fontSize: 24,
                                        color: AppColor.lightText),
                              ),
                            ),
                          ),
                          // Products Grid
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: filteredProduct.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 9 / 16,
                            ),
                            itemBuilder: (context, index) {
                              return Card(
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Image.network(
                                            filteredProduct[index]["imageUrl"],
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(
                                            Dimension.paddingSmall),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              filteredProduct[index]["title"],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(fontSize: 20),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              filteredProduct[index]
                                                  ["description"],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                            Text(
                                              "Rs ${filteredProduct[index]["price"]}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                            Center(
                                              child: ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimension
                                                          .borderRadiusSmall,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Provider.of<cartProvider>(
                                                          context,
                                                          listen: false)
                                                      .addItem(filteredProduct[
                                                          index]);
                                                  SnackBar sb = SnackBar(
                                                    content: Text(
                                                      "${filteredProduct[index]["title"]} added to Bucket!",
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    backgroundColor:
                                                        Colors.green,
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(sb);
                                                },
                                                label: Text(
                                                  "ADD TO BUCKET",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall!
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("Unable to fetch data"),
            );
          }
        },
      ),
    );
  }
}
