import 'package:flutter/cupertino.dart';
import 'package:leprechaun/presentation/wallet/widgets/transaction_widget.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TransactionWidget(
          text: 'Foods',
          color: Color(0xFF4BB955),
          icon: 'foods',
          transactionColor: Color(0xFFF34747),
          transaction: '-\$10.00',
        ),
        TransactionWidget(
          text: 'Clothes',
          color: Color(0xFFFF97E8),
          icon: 'clothes',
          transactionColor: Color(0xFFF34747),
          transaction: '-\$10.00',
        ),
        TransactionWidget(
          text: 'Travel',
          color: Color(0xFF3DD0FF),
          icon: 'travel',
          transactionColor: Color(0xFFF34747),
          transaction: '-\$10.00',
        ),
        TransactionWidget(
          text: 'For Home Goods',
          color: Color(0xFFFFCB46),
          icon: 'home',
          transactionColor: Color(0xFFF34747),
          transaction: '-\$10.00',
        ),
        TransactionWidget(
          text: 'Salary',
          color: Color(0xFF776BFE),
          icon: 'salary',
          transactionColor: Color(0xFF4BB955),
          transaction: '+\$100.00',
        ),
      ],
    );
  }
}
