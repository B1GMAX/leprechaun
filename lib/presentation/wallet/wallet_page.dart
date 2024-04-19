import 'package:flutter/material.dart';
import 'package:leprechaun/presentation/wallet/widgets/add_icon.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Wallet',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900, color: Colors.white
                  ),
                ),
                AddIcon(
                  onAddPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
