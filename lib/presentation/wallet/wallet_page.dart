import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leprechaun/presentation/wallet/controller/controller.dart';
import 'package:leprechaun/presentation/wallet/widgets/add_icon.dart';
import 'package:leprechaun/presentation/wallet/widgets/all_family_widget.dart';
import 'package:leprechaun/presentation/wallet/widgets/card_widget.dart';
import 'package:leprechaun/presentation/wallet/widgets/cards_list_widget.dart';
import 'package:leprechaun/presentation/wallet/widgets/family_user_widget.dart';
import 'package:leprechaun/presentation/wallet/widgets/transaction_widget.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    return SafeArea(
      child: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
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
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Send Money To',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        AllFamilyWidget(
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...List.generate(
                          4,
                          (index) => FamilyUserWidget(index: index + 1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Transactions',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const TransactionWidget(
                      text: 'Foods',
                      color: Color(0xFF4BB955),
                      icon: 'foods',
                      transactionColor: Color(0xFFF34747),
                      transaction: '-\$10.00',
                    ),
                    const TransactionWidget(
                      text: 'Clothes',
                      color: Color(0xFFFF97E8),
                      icon: 'clothes',
                      transactionColor: Color(0xFFF34747),
                      transaction: '-\$10.00',
                    ),
                    const TransactionWidget(
                      text: 'Travel',
                      color: Color(0xFF3DD0FF),
                      icon: 'travel',
                      transactionColor: Color(0xFFF34747),
                      transaction: '-\$10.00',
                    ),
                    const TransactionWidget(
                      text: 'For Home Goods',
                      color: Color(0xFFFFCB46),
                      icon: 'home',
                      transactionColor: Color(0xFFF34747),
                      transaction: '-\$10.00',
                    ),
                    const TransactionWidget(
                      text: 'Salary',
                      color: Color(0xFF776BFE),
                      icon: 'salary',
                      transactionColor: Color(0xFF4BB955),
                      transaction: '+\$100.00',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
