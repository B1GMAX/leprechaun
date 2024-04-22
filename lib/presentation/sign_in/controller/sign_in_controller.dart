import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leprechaun/core/firebase_services/auth_service.dart';
import 'package:leprechaun/presentation/pin_code/pin_code_page.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final _authService = AuthService();
  final RxBool isPasswordVisible = false.obs;

  void updatePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> createViaPasswordAndEmail() async {
    final user = await _authService.createViaPasswordAndEmail(
        emailTextController.text.trim(), passwordTextController.text.trim());
    if (user != null) {
      Get.to(() => const PinCodePage(showBackButton: true));
    }
  }

  Future<void> loginWithGoogle() async {
    final user = await _authService.loginWithGoogle();
    if (user != null) {
      Get.to(() => const PinCodePage(showBackButton: true));
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
  }
}
