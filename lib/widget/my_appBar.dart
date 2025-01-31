import 'package:flutter/material.dart';
import 'package:kfc_project/images.dart';
import 'package:kfc_project/colors.dart';
import 'package:provider/provider.dart';
import 'package:kfc_project/providers/cart_provider.dart';
import 'package:kfc_project/pages/cart_page.dart';

// Rename the class to avoid conflict with Flutter's built-in AppBar
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    // Access the provider within the build method
    cartProvider cartprovider =
        Provider.of<cartProvider>(context, listen: true);

    return AppBar(
      leading: Builder(
        builder: (context) {
          // Determine if the page can pop
          bool canPop = ModalRoute.of(context)!.canPop;
          return canPop
              ? IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                )
              : IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Image.asset(
                    Images.menuIcon,
                    color: Theme.of(context).appBarTheme.foregroundColor,
                  ),
                );
        },
      ),
      title: Image.asset(
        Images.kfcLogo,
        height: 40, // Set a height for the logo to fit nicely
      ),
      centerTitle: true,
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              onPressed: () {
                // Add action for the bucket icon here
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ));
              },
              icon: Image.asset(Images.bucketLogo),
            ),
            // Display the cart count
            Positioned(
              bottom: 12,
              child: Text(
                cartprovider.getCartCount().toString(), // Show cart count
                style: const TextStyle(
                  color: AppColor.lightText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
