import 'package:flutter/material.dart';
import 'package:kfc_project/colors.dart';

class kfcBox extends StatelessWidget {
  const kfcBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 15,
          height: 22,
          color: AppColor.brandColor,
        ),
        Container(
          width: 15,
          height: 22,
          color: AppColor.brandColor,
          margin: const EdgeInsets.symmetric(horizontal: 7),
        ),
        Container(
          width: 15,
          height: 22,
          color: AppColor.brandColor,
        )
      ],
    );
  }
}
