import 'dart:ui';

class CardModel {
  final String balance;
  final String number;
  final Color color;
  final String? name;

  CardModel({
    required this.color,
    required this.balance,
    required this.number,
    this.name,
  });
}
