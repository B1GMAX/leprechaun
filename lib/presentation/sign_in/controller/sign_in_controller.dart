import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leprechaun/core/auth_service/auth_service.dart';

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
  }

  Future<void> loginWithGoogle() async {
    final user = await _authService.loginWithGoogle();
    if(user != null){
      print('user ne null - $user');
      
    }
  }
}
