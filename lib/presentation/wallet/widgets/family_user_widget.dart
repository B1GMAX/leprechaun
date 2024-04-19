import 'package:flutter/material.dart';

class FamilyUserWidget extends StatefulWidget {
  final int index;
  final VoidCallback? onPressed;

  const FamilyUserWidget({required this.index, this.onPressed, super.key});

  @override
  State<FamilyUserWidget> createState() => _FamilyUserWidgetState();
}

class _FamilyUserWidgetState extends State<FamilyUserWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        border: Border.all(color: const Color(0xFF4BB955), width: 1),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(15),
      child: widget.index == 4
          ? Image.asset('assets/family_3.png')
          : Image.asset('assets/family_${widget.index}.png'),
    );
  }
}
