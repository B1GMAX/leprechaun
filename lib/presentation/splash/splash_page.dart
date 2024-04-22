import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:leprechaun/presentation/pin_code/pin_code_page.dart';
import 'package:leprechaun/presentation/sign_in/sign_in_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => FirebaseAuth.instance.currentUser != null
          ? const PinCodePage()
          : const SignInPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/lepr.png')),
          const SizedBox(height: 15),
          const Text(
            'Leprechaun',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
