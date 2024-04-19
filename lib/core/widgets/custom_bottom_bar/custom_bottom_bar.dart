import 'package:flutter/material.dart';
import 'package:leprechaun/core/widgets/custom_bottom_bar/icon_widget.dart';

import 'bnb_painter.dart';

class CustomBottomBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const CustomBottomBar({
    required this.onTap,
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return  SizedBox(
      width: size.width,
      height: 85,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: Size(size.width, 85),
            painter: BNBCustomPainter(),
          ),
          Center(
            heightFactor: 0.7,
            child: FloatingActionButton(
              backgroundColor: const Color(0xFF4BB955),
              elevation: 0.1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {},
              child: Image.asset('assets/plus.png'),
            ),
          ),
          SizedBox(
            width: size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconWidget(
                  onTap: () {
                    onTap(0);
                  },
                  icon: 'home',
                  text: 'Home',
                  color: currentIndex == 0
                      ? const Color(0xFF4BB955)
                      : Colors.grey.shade400,
                ),
                IconWidget(
                  onTap: () {
                    onTap(1);
                  },
                  icon: 'wallet',
                  text: 'Wallets',
                  color: currentIndex == 1
                      ? const Color(0xFF4BB955)
                      : Colors.grey.shade400,
                ),
                Container(
                  width: size.width * 0.20,
                ),
                IconWidget(
                  onTap: () {
                    onTap(2);
                  },
                  icon: 'fire',
                  text: 'Leaders',
                  color: currentIndex == 2
                      ? const Color(0xFF4BB955)
                      : Colors.grey.shade400,
                ),
                IconWidget(
                  onTap: () {
                    onTap(3);
                  },
                  icon: 'person',
                  text: 'Profile',
                  color: currentIndex == 3
                      ? const Color(0xFF4BB955)
                      : Colors.grey.shade400,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
