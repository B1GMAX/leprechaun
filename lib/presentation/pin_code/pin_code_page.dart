import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leprechaun/core/widgets/custom_back_icon.dart';
import 'package:leprechaun/presentation/pin_code/controller/controller.dart';
import 'package:leprechaun/presentation/pin_code/widgets/code_way_widget.dart';
import 'package:leprechaun/presentation/pin_code/widgets/numeric_keyboard.dart';

class PinCodePage extends StatelessWidget {
  const PinCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pinCodeController = Get.put(PinCodeController());
    return Scaffold(
      backgroundColor: const Color(0xFF4BB955),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomBackIcon(
                    backGroundColor: Colors.white,
                    iconColor: Color(0xFF4BB955),
                  ),
                  const SizedBox(height: 15),
                  Image.asset('assets/lepricon.png'),
                  const SizedBox(height: 15),
                  const Text(
                    'Set Up PIN Code',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => CodeWayWidget(
                      length: pinCodeController.input.value.length,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Expanded(
              child: NumericKeyboard(),
            ),

          ],
        ),
      ),
    );
  }
}
