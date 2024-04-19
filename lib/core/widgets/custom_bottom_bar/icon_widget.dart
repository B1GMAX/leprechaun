import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final String text;
  final Color color;

  const IconWidget({
    required this.onTap,
    required this.icon,
    required this.text,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 7),
          Image.asset(
            'assets/$icon.png',
            color: color,
            colorBlendMode: BlendMode.srcIn,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
