import 'package:flutter/material.dart';

class CodeWayWidget extends StatelessWidget {
  final int length;

  const CodeWayWidget({
    required this.length,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        4,
        (index) {
          return Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
              color: length >= index + 1 ? Colors.white : Colors.transparent,
            ),
          );
        },
      ),
    );
  }
}
