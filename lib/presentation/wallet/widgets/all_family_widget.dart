import 'package:flutter/material.dart';

class AllFamilyWidget extends StatelessWidget {
  const AllFamilyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        color: const Color(0xFF4BB955).withOpacity(0.2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      child: const Row(
        children: [
          Text(
            'All Family',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Color(0xFF4BB955),
            ),
          ),
          SizedBox(width: 5),
          Icon(
            Icons.arrow_forward_ios,
            size: 9,
            color: Color(0xFF4BB955),
          )
        ],
      ),
    );
  }
}
