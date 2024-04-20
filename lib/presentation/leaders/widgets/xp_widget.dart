import 'package:flutter/material.dart';

class XpWidget extends StatelessWidget {
  final bool isSelected;

  const XpWidget({required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 95,
      height: 60,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 90,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                color: Color(0xFFFFCB46),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 7,
              ),
              child: Text(
                '1 000 XP',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.black : Colors.white,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Positioned(
            top: 14,
            left: 0,
            child: Image.asset(
              'assets/xp.png',
            ),
          ),
        ],
      ),
    );
  }
}
