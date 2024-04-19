import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leprechaun/core/widgets/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:leprechaun/presentation/wallet/wallet_page.dart';

import 'controller/root_controller.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rootController = Get.put(RootController());
    return Obx(
      () => Scaffold(
        bottomNavigationBar: CustomBottomBar(
          onTap: (index) {
            rootController.navigateTo(index);
          },
          currentIndex: rootController.currentIndex.value,
        ),
        body: PageView(
          controller: rootController.pageController.value,
          children: [
            Center(
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            WalletPage(),
          ],
        ),
      ),
    );
  }
}