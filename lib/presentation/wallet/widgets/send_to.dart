import 'package:flutter/material.dart';

import 'all_family_widget.dart';
import 'family_user_widget.dart';

class SendTo extends StatelessWidget {
  final String text;
  final Function(int) onPressed;
  final int? selectedIndex;

  const SendTo({
    required this.text,
    required this.onPressed,
    this.selectedIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            const AllFamilyWidget(),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
              4,
                  (index) =>
                  FamilyUserWidget(
                    index: index,
                    onPressed: onPressed, isSelected: index == selectedIndex,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
