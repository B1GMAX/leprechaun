import 'package:flutter/material.dart';

class CurrencyDropMenu extends StatelessWidget {
  final String value;
  final Function(String?)? onChange;
  final List<String> currencyList;

  const CurrencyDropMenu({
    required this.value,
    required this.onChange,
    required this.currencyList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        padding: const EdgeInsets.only(right: 15),
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: Color(0xFF8B97A9),
        ),
        icon: const RotatedBox(
          quarterTurns: 1,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF4BB955),
          ),
        ),
        value: value,
        onChanged: onChange,
        items: currencyList
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
