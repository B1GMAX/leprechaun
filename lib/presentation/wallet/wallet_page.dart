import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leprechaun/presentation/wallet/controller/controller.dart';
import 'package:leprechaun/presentation/wallet/widgets/add_icon.dart';
import 'package:leprechaun/presentation/wallet/widgets/card_widget.dart';
import 'package:leprechaun/presentation/wallet/widgets/cards_list_widget.dart';
import 'package:leprechaun/presentation/wallet/widgets/create_card_bs.dart';
import 'package:leprechaun/presentation/wallet/widgets/send_to.dart';
import 'package:leprechaun/presentation/wallet/widgets/transaction_list_widget.dart';
import 'package:leprechaun/presentation/wallet/widgets/transfer_bs.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    return Obx(
      () => SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
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
                        onAddPressed: () {
                          Get.bottomSheet(
                            const CreateCardBs(),
                            backgroundColor: Colors.black.withOpacity(0.1),
                            isScrollControlled: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                CardsListWidget(
                  items: walletController.cardList
                      .map(
                        (card) => CardWidget(
                          cardModel: card,
                        ),
                      )
                      .toList(),
                  onPageChanged: (index, _) {
                    walletController.updateCurrentIndex(index);
                  },
                ),
                DotsIndicator(
                  dotsCount: walletController.cardList.length,
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
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SendTo(
                        text: 'Send Money To',
                        onPressed: (index) {
                          walletController.updateSelectedFamilyIndex(index);
                          Get.bottomSheet(
                            isScrollControlled: true,
                            const TransferBs(),
                            backgroundColor: const Color(0xFF20265F),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10.0)),
                            ),
                          );
                        },
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
                      const TransactionListWidget(),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
            Positioned(
              top: 130,
              right: 10,
              child: Image.asset('assets/wallet_leprechaun.png'),
            ),
          ],
        ),
      ),
    );
  }
}
