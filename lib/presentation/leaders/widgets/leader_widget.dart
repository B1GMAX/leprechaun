import 'package:flutter/material.dart';
import 'package:leprechaun/presentation/leaders/widgets/xp_widget.dart';

class LeaderWidget extends StatelessWidget {
  final int index;
  final String name;
  final bool isSelected;
  final Function(int) onPressed;

  const LeaderWidget({
    required this.index,
    required this.name,
    required this.isSelected,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(isSelected ? 0xFF776BFE : 0xFF151B3A),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 5,
        ),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '${index + 1}.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? Colors.white : const Color(0xFF4BB955),
                  ),
                ),
                const SizedBox(width: 15),
                Image.asset('assets/leader.png'),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '100 Items',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            XpWidget(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}
