import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leprechaun/core/models/card_model.dart';

class WalletController extends GetxController {
  RxString selectedCurrency = '\$'.obs;
  RxInt selectedFamilyIndex = 0.obs;
  RxInt selectedCurrencyIndex = 0.obs;
  RxInt selectedCurrencyValue = 20.obs;
  RxInt currentIndex = 0.obs;

  final bsTextController = TextEditingController(text: '20');

  final List<String> currencyList = ['\$', '€'];



  void selectCurrency(int index, int currency) {
    selectedCurrencyIndex.value = index;
    selectedCurrencyValue.value = currency;
    bsTextController.text = currency.toString();
  }

  void updateSelectedFamilyIndex(int index) {
    selectedFamilyIndex.value = index;
  }

  void updateSelectedCurrency(String value) {
    selectedCurrency.value = value;
  }

  double? autoConvertCurrency() {
    if (selectedCurrency.value == '€') {
    double value = double.parse(bsTextController.value.text.trim());
     return value = value + 1;
    }
    return null;
  }

  int checkSelectedCurrencyIndex(int index) {
    if (index == 1) {
      return 50;
    }
    if (index == 2) {
      return 100;
    }
    if (index == 3) {
      return 500;
    }
    return 20;
  }

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
      balance: '10.00',
      number: '1234 5678 9078 1234',
    ),
  ];



  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }
}
