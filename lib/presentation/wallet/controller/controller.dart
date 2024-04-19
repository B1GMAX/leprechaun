import 'dart:math';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:leprechaun/core/models/card_model.dart';

class WalletController extends GetxController {
  Color generateRandomColor() {
    Random random = Random();

    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);

    double shadeFactor = 0.5 + random.nextDouble();

    red = (red * shadeFactor).toInt().clamp(0, 255);
    green = (green * shadeFactor).toInt().clamp(0, 255);
    blue = (blue * shadeFactor).toInt().clamp(0, 255);

    return Color.fromRGBO(red, green, blue, 1.0);
  }

  final List<CardModel> cardList = [
    CardModel(
      color: const Color(0xFFFF97E8),
      balance: '50,450.00',
      number: '1234 5678 9078 1234',
    ),
    CardModel(
      color: const Color(0xFF776BFE),
      balance: '450.00',
      number: '1234 5678 9078 1234',
    ),
    CardModel(
      color: const Color(0xFFF4AB2A),
      balance: '0.00',
      number: '1234 5678 9078 1234',
    ),
  ];

  RxInt currentIndex = 0.obs;

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }
}
