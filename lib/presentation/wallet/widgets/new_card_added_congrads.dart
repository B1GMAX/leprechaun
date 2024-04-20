import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewCardAddedCongrads extends StatelessWidget {
  const NewCardAddedCongrads({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          border: Border.all(
              color: const Color(0xFFFFCB46).withOpacity(0.6), width: 5),
          color: const Color(0xFF20265F),
        ),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Material(
          color: const Color(0xFF20265F),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Account Number',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Congrats your new card added',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              Image.asset('assets/smile.png'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: Get.back,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4BB955),
                ),
                child: const Text(
                  'Got it',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
