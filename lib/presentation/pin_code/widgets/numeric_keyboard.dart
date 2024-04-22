import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leprechaun/consts.dart';
import 'package:leprechaun/presentation/pin_code/controller/controller.dart';
import 'package:leprechaun/presentation/root/root_page.dart';

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
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 2.3,
              children: List.generate(9, (index) {
                return KeyboardKeyWidget(
                  keyValue: (index + 1).toString(),
                  onKeyPressed: pinCodeController.onKeyPressed,
                );
              }),
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
                  keyValue: bksp,
                  onKeyPressed: pinCodeController.onKeyPressed,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: ElevatedButton(
                onPressed: () {
                  pinCodeController.savePinCode();
                  pinCodeController.checkEnteredCode();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4BB955),
                ),
                child: Text(
                  pinCodeController.savedPin.isEmpty ? 'Set up' : 'Enter',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            if (pinCodeController.savedPin.isEmpty) ...[
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Get.to(() => const RootPage());
                },
                child: const Text(
                  'Without Code',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4BB955),
                  ),
                ),
              ),
            ],
            if (!pinCodeController.isCorrect.value) ...[
              const SizedBox(height: 15),
              const Text(
                'Wrong Pin Code',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
