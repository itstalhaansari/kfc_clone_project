import 'package:flutter/material.dart';
import 'package:kfc_project/pages/homepage.dart';
import 'package:kfc_project/widget/my_appBar.dart';

class orderSubmitted extends StatefulWidget {
  final String orderId;
  const orderSubmitted({super.key, required this.orderId});

  @override
  State<orderSubmitted> createState() => _OrderSubmittedState();
}

class _OrderSubmittedState extends State<orderSubmitted> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Homepage()), // Fixed
          (route) => false,
        );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Order placed Successfully"),
              const Text("Your Id is"),
              Text("${widget.orderId}"),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const Homepage()), // Fixed
                    (route) => false,
                  );
                },
                child: const Text("Go to Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
