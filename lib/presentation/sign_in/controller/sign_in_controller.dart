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

  void updatePasswordVisibility(bool isVisible) {
    isPasswordVisible.value = !isVisible;
  }

  Future<void> createViaPasswordAndEmail(String email, String password) async {
    final user = await _authService.createViaPasswordAndEmail(email, password);
    if (user != null) {
      Get.to(const PinCodePage());
    }
  }

  Future<void> loginWithGoogle() async {
    final user = await _authService.loginWithGoogle();
    if (user != null) {
      Get.to(const PinCodePage());
    }
  }
}
