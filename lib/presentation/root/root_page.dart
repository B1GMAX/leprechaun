import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leprechaun/core/widgets/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:leprechaun/presentation/leaders/leaders_page.dart';
import 'package:leprechaun/presentation/wallet/wallet_page.dart';

import 'controller/root_controller.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rootController = Get.put(RootController());
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: rootController.pageController.value,
                children: const [
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
                  LeadersPage(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomBottomBar(
                  onTap: rootController.navigateTo,
                  currentIndex: rootController.currentIndex.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
