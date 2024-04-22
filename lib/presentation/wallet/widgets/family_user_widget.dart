import 'package:flutter/material.dart';

class FamilyUserWidget extends StatelessWidget {
  final int index;
  final Function(int) onPressed;
  final bool? isSelected;

  const FamilyUserWidget({
    required this.index,
    required this.onPressed,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(index);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              border: Border.all(color: const Color(0xFF4BB955), width: 2),
              color: Colors.white,
            ),
            height: 70,
            width: 70,
            child: Image.asset('assets/family_${index == 3 ? '2' : index}.png'),
          ),
          if (isSelected != null && isSelected!)
            Positioned(
              right: 1,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: Color(0xFF4BB955),
                  ),
                  padding: const EdgeInsets.all(1),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
