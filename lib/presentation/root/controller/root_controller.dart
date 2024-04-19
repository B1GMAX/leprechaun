import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  final pageController = PageController().obs;

  RxInt currentIndex = 0.obs;

  void navigateTo(int index) {
    currentIndex.value = index;
    pageController.value.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
