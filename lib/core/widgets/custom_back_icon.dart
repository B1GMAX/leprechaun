import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CustomBackIcon extends StatelessWidget {
  final Color backGroundColor;
  final Color iconColor;

  const CustomBackIcon({
    required this.backGroundColor,
    required this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            color: backGroundColor,
          ),
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: iconColor,
            size: 10,
          ),
        ),
      ),
    );
  }
}
