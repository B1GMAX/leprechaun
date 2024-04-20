import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leprechaun/core/widgets/custom_back_icon.dart';
import 'package:email_validator/email_validator.dart';
import 'controller/sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signInController = Get.put(SignInController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: SingleChildScrollView(
            child: Form(
              key: signInController.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomBackIcon(
                    backGroundColor: Colors.white.withOpacity(0.2),
                    iconColor: const Color(0xFFBCBCBC),
                  ),
                  const SizedBox(height: 5),
                  Image.asset(
                    'assets/hi.png',
                    height: 250,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 10),
                        child: Image.asset('assets/profile.png'),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextFormField(
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                          style: const TextStyle(color: Colors.white),
                          controller: signInController.emailTextController,
                          decoration: const InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF8B97A9),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        child: Image.asset('assets/lock.png'),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Obx(
                          () => TextFormField(
                            validator: (value) {
                              if (value != null && value.length < 6) {
                                return 'Enter min. 7 characters';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.white),
                            obscureText:
                                signInController.isPasswordVisible.value,
                            controller: signInController.passwordTextController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF8B97A9),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  signInController.updatePasswordVisibility(
                                      signInController.isPasswordVisible.value);
                                },
                                icon: signInController.isPasswordVisible.value
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color: Colors.white,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: ElevatedButton(
                      onPressed: () {
                        if (signInController.formKey.currentState!.validate()) {
                          signInController.createViaPasswordAndEmail(
                            signInController.emailTextController.text.trim(),
                            signInController.passwordTextController.text.trim(),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Gets Start',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Or continue with social account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: signInController.loginWithGoogle,
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          color: Colors.white),
                      child: Image.asset('assets/google.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
