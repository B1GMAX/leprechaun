import 'package:flutter/material.dart';
import 'package:leprechaun/core/models/card_model.dart';

class CardWidget extends StatelessWidget {
  final CardModel cardModel;

  const CardWidget({
    required this.cardModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: cardModel.color,
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Balance',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
              Image.asset('assets/visa.png')
            ],
          ),
          Text(
            '\$${cardModel.balance}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            cardModel.number,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          if (cardModel.name != null && cardModel.name!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              cardModel.name!,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ],
        ],
      ),
    );
  }
}
