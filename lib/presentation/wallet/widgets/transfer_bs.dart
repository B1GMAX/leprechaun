import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leprechaun/presentation/wallet/controller/controller.dart';
import 'package:leprechaun/presentation/wallet/widgets/aouto_convert_list_widget.dart';
import 'package:leprechaun/presentation/wallet/widgets/currency_drop_menu.dart';
import 'package:leprechaun/presentation/wallet/widgets/send_to.dart';

class TransferBs extends StatelessWidget {
  const TransferBs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    final width = MediaQuery.of(context).size.width;
    return Obx(
      () => Container(
        height: width * 0.95,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SendTo(
                text: 'Transfer to',
                selectedIndex: walletController.selectedFamilyIndex.value,
                onPressed: (index) {
                  walletController.updateSelectedFamilyIndex(index);
                },
              ),
              const SizedBox(height: 25),
              const Text(
                'Total amount',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF8B97A9),
                ),
              ),
              TextField(
                controller: walletController.bsTextController,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  suffixIcon: CurrencyDropMenu(
                    value: walletController.selectedCurrency.value,
                    onChange: (value) {
                      if (value != null) {
                        walletController.updateSelectedCurrency(value);
                      }
                    },
                    currencyList: walletController.currencyList,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    4,
                    (index) {
                      return AutoConvertListWidget(
                        index: index,
                        isSelected: index ==
                            walletController.selectedCurrencyIndex.value,
                        onPressed: (index, currency) {
                          walletController.selectCurrency(index, currency);
                        },
                        value:
                            walletController.checkSelectedCurrencyIndex(index),
                      );
                    },
                  ),
                ],
              ),
              if (walletController.selectedCurrency.value == '€')
                Text(
                  'Auto Convert ${walletController.bsTextController.value.text}€ = ${walletController.autoConvertCurrency()}\$',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4BB955),
                  ),
                ),
              const SizedBox(height: 25),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4BB955),
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
