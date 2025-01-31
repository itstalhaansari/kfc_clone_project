import 'package:flutter/material.dart';
import 'package:kfc_project/colors.dart';
import 'package:kfc_project/dimensions.dart';
import 'package:kfc_project/pages/checkOut.dart';
import 'package:kfc_project/providers/cart_provider.dart';
import 'package:kfc_project/spacing.dart';
import 'package:kfc_project/widget/my_appBar.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // Access the cartProvider here, where context is valid
    final cartprovider = Provider.of<cartProvider>(context, listen: true);

    final List<Map<String, dynamic>> cartItems = cartprovider.getCartItems();

    return Scaffold(
      appBar: const CustomAppBar(),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Your cart is empty!",
                style: TextStyle(fontSize: 20),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(Dimension.paddingBody),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        var Currentitem = cartItems[index];
                        return Card(
                          child: Padding(
                            padding:
                                const EdgeInsets.all(Dimension.paddingSmall),
                            child: Row(
                              children: [
                                Image.network(
                                  Currentitem["imageUrl"],
                                  width: 100,
                                ),
                                spacing.smallX,
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          spacing.smallX,
                                          Expanded(
                                              child: Text(
                                            Currentitem["title"].toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          )),
                                          Text(
                                            "Rs. ${Currentitem["price"]}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              cartprovider.decrement(index);
                                            },
                                            icon: Icon(
                                                Currentitem["quantity"] == 1
                                                    ? Icons.delete
                                                    : Icons.remove),
                                            style: IconButton.styleFrom(
                                              minimumSize: const Size(0, 0),
                                              fixedSize: const Size(40, 32),
                                              padding: const EdgeInsets.all(0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(Dimension
                                                          .borderRadiusSmall),
                                                  side: const BorderSide(
                                                      color:
                                                          AppColor.brandColor)),
                                            ),
                                          ),
                                          SizedBox(
                                              width: 34,
                                              child: Text(
                                                Currentitem["quantity"]
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                              )),
                                          IconButton(
                                            onPressed: () {
                                              cartprovider.increment(index);
                                              if (Currentitem["quantity"] ==
                                                  8) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            "Can't Add more quantity")));
                                              }
                                            },
                                            icon: const Icon(Icons.add),
                                            style: IconButton.styleFrom(
                                              minimumSize: const Size(0, 0),
                                              fixedSize: const Size(40, 32),
                                              padding: const EdgeInsets.all(0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(Dimension
                                                          .borderRadiusSmall),
                                                  side: const BorderSide(
                                                      color:
                                                          AppColor.brandColor)),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const checkout(),
                      ));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: AppColor.brandColor,
                          borderRadius: BorderRadius.only(
                              topLeft:
                                  Radius.circular(Dimension.borderRadiusSmall),
                              topRight: Radius.circular(
                                  Dimension.borderRadiusSmall))),
                      child: Padding(
                        padding: const EdgeInsets.all(Dimension.paddingMedium),
                        child: Row(
                          children: [
                            Text(
                              "${cartprovider.getCartCount()} items  |  ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              "Rs.${cartprovider.getCartTotalAmount()}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: Colors.white),
                            ),
                            const Spacer(),
                            Text(
                              "Checkout",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: Colors.white),
                            ),
                            spacing.smallX,
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Icon(Icons.chevron_right))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
