import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {
  final Color color;
  final String icon;
  final Color transactionColor;
  final String transaction;
  final String text;

  const TransactionWidget({
    required this.color,
    required this.icon,
    required this.transactionColor,
    required this.transaction,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
                color: color,
              ),
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset('assets/$icon.png'),
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            color: transactionColor.withOpacity(0.2),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          child: Text(
            transaction,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: transactionColor,
            ),
          ),
        ),
      ],
    );
  }
}
