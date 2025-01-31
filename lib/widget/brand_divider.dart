import 'package:flutter/material.dart';
import 'package:kfc_project/colors.dart';

class brand_divider extends StatelessWidget {
  const brand_divider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 64,
      child: Divider(
        thickness: 3,
        color: AppColor.brandColor,
      ),
    );
  }
}
