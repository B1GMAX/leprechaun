import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leprechaun/presentation/wallet/controller/controller.dart';
import 'package:leprechaun/presentation/wallet/widgets/new_card_added_congrads.dart';

class CreateCardBs extends StatelessWidget {
  const CreateCardBs({super.key});

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.45,
      color: const Color(0xFF20265F),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: Get.back,
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
          const Text(
            'Name',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF8B97A9),
            ),
          ),
          TextField(
            controller: walletController.cardNameTextController,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Sum',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF8B97A9),
            ),
          ),
          TextField(
            controller: walletController.cardSumTextController,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                walletController.addNewCard();
                Get.back();
                Get.dialog(const NewCardAddedCongrads(),);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4BB955),
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
