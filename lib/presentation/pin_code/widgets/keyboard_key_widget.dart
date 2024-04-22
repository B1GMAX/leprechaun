import 'package:flutter/material.dart';
import 'package:leprechaun/consts.dart';

class KeyboardKeyWidget extends StatelessWidget {
  final String keyValue;
  final Function(String) onKeyPressed;

  const KeyboardKeyWidget({
    required this.keyValue,
    required this.onKeyPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onKeyPressed(keyValue);
      },
      child: Text(
        keyValue == bksp ? '⌫' : keyValue,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
