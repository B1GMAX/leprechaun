import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leprechaun/presentation/pin_code/controller/controller.dart';

import 'keyboard_key_widget.dart';

class NumericKeyboard extends StatelessWidget {
  const NumericKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    final pinCodeController = Get.put(PinCodeController());
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: Color(0xFF20265F),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyboardKeyWidget(
                keyValue: '1',
                onKeyPressed: pinCodeController.onKeyPressed,
              ),
              KeyboardKeyWidget(
                keyValue: '2',
                onKeyPressed: pinCodeController.onKeyPressed,
              ),
              KeyboardKeyWidget(
                keyValue: '3',
                onKeyPressed: pinCodeController.onKeyPressed,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyboardKeyWidget(
                keyValue: '4',
                onKeyPressed: pinCodeController.onKeyPressed,
              ),
              KeyboardKeyWidget(
                keyValue: '5',
                onKeyPressed: pinCodeController.onKeyPressed,
              ),
              KeyboardKeyWidget(
                keyValue: '6',
                onKeyPressed: pinCodeController.onKeyPressed,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyboardKeyWidget(
                keyValue: '7',
                onKeyPressed: pinCodeController.onKeyPressed,
              ),
              KeyboardKeyWidget(
                keyValue: '8',
                onKeyPressed: pinCodeController.onKeyPressed,
              ),
              KeyboardKeyWidget(
                keyValue: '9',
                onKeyPressed: pinCodeController.onKeyPressed,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 70),
              KeyboardKeyWidget(
                keyValue: '0',
                onKeyPressed: pinCodeController.onKeyPressed,
              ),
              KeyboardKeyWidget(
                keyValue: 'bksp',
                onKeyPressed: pinCodeController.onKeyPressed,
              ),
            ],
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              pinCodeController.savePinCode();
            },
            child: const Text(
              'Set up',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
