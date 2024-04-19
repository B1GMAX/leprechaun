import 'package:flutter/cupertino.dart';

class AddIcon extends StatelessWidget {
  final VoidCallback onAddPressed;

  const AddIcon({
    required this.onAddPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50),),
        color: Color(0xFF776BFE),
      ),
      padding: const EdgeInsets.all(10),
      child: Image.asset('assets/plus.png'),
    );
  }
}
