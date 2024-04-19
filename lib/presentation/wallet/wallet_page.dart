import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leprechaun/presentation/wallet/controller/controller.dart';
import 'package:leprechaun/presentation/wallet/widgets/add_icon.dart';
import 'package:leprechaun/presentation/wallet/widgets/card_widget.dart';
import 'package:leprechaun/presentation/wallet/widgets/cards_list_widget.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Obx(
          () => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Wallet',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  AddIcon(
                    onAddPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CardsListWidget(
                items: walletController.cardList
                    .map(
                      (card) => CardWidget(
                        color: card.color,
                        balance: card.balance,
                        number: card.number,
                      ),
                    )
                    .toList(),
                onPageChanged: (index, _) {
                  walletController.updateCurrentIndex(index);
                },
              ),
              DotsIndicator(
                dotsCount: 3,
                position: walletController.currentIndex.value,
                decorator: DotsDecorator(
                  color: Colors.green.withOpacity(0.5),
                  activeColor: Colors.green,
                  size: const Size.square(9.0),
                  activeSize: const Size(32, 9),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
