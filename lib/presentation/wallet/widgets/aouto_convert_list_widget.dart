import 'package:flutter/material.dart';

class AutoConvertListWidget extends StatelessWidget {
  final int index;
  final bool isSelected;
  final Function(int, int) onPressed;
  final int value;

  const AutoConvertListWidget({
    required this.index,
    required this.isSelected,
    required this.onPressed,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed(index, value);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
          color: !isSelected
              ? const Color(0xFF4BB955).withOpacity(0.2)
              : const Color(0xFF4BB955),
        ),
        width: 55,
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Center(
          child: Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
