import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kfc_project/dimensions.dart';
import 'package:kfc_project/pages/order_submitted.dart';
import 'package:kfc_project/providers/cart_provider.dart';
import 'package:kfc_project/spacing.dart';
import 'package:kfc_project/widget/my_appBar.dart';
import 'package:provider/provider.dart';

class checkout extends StatefulWidget {
  const checkout({super.key});

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  var selectedcity = "Multan";
  var selectedPaymentMethod = "CashOnDelivery";
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController townAddressController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimension.paddingBody),
          child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery details",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    spacing.mediumY,
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        label: Text("Full Name"),
                      ),
                    ),
                    spacing.mediumY,
                    TextFormField(
                      controller: mobileController,
                      maxLength: 13,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        } else if (value.length < 11) {
                          return "Please enter a valid mobile number";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        label: Text("Mobile Number"),
                      ),
                    ),
                    spacing.mediumY,
                    TextFormField(
                      controller: streetAddressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Text(
                            "Block/Sector,Street/Building/Floor Name or  Number"),
                      ),
                    ),
                    spacing.mediumY,
                    TextFormField(
                      controller: townAddressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Text("Main Area/Town/Near Landmark"),
                      ),
                    ),
                    spacing.mediumY,
                    DropdownButtonFormField(
                      value: selectedcity,
                      items: const [
                        DropdownMenuItem(
                          child: Text("Multan"),
                          value: "Multan",
                        ),
                        DropdownMenuItem(
                          child: Text("Lahore"),
                          value: "Lahore",
                        ),
                        DropdownMenuItem(
                          child: Text("DGK"),
                          value: "DGK",
                        ),
                        DropdownMenuItem(
                          value: "Sialkot",
                          child: Text("Sialkot"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedcity = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text("Cash on Delivery"),
                      value: "CashOnDelivery",
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text("Cards on DoorStep"),
                      value: "CardsOnDoorStep",
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value!;
                        });
                      },
                    ),
                    spacing.mediumY,
                    isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  //getData
                                  String name = nameController.text.trim();
                                  String mobile = mobileController.text.trim();
                                  String town =
                                      townAddressController.text.trim();
                                  String street =
                                      streetAddressController.text.trim();

                                  String address =
                                      "${town},${street},${selectedcity}";
                                  var cartItem = Provider.of<cartProvider>(
                                          context,
                                          listen: false)
                                      .getCartItems();
                                  var orderData = {
                                    "name": name,
                                    "mobile": mobile,
                                    "address": address,
                                    "city": selectedcity,
                                    "paymentMethod": selectedPaymentMethod,
                                    "orderItem": cartItem,
                                    "orderTime":
                                        DateTime.now().millisecondsSinceEpoch,
                                    "status": "new"
                                  };
                                  setState(() {
                                    isLoading = true;
                                  });

                                  var db = FirebaseFirestore.instance;
                                  db.collection("Orders").add(orderData).then(
                                      (value) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Provider.of<cartProvider>(context,
                                            listen: false)
                                        .clearCart();
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          orderSubmitted(orderId: value.id),
                                    ));
                                    //        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Order placed successfully with ID ${value.id}"),backgroundColor: Colors.green,));
                                  }, onError: (error) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text("Error:${error}")));
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                              ),
                              child: const Text(
                                "Place an order",
                                style: TextStyle(fontSize: 17),
                              ),
                            ))
                  ])),
        ),
      ),
    );
  }
}
