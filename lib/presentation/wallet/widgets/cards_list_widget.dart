import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CardsListWidget extends StatelessWidget {
  final List<Widget> items;
  final Function(int, CarouselPageChangedReason) onPageChanged;

  const CardsListWidget({
    required this.onPageChanged,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items,
      options: CarouselOptions(
        padEnds: false,
        aspectRatio: 0,
        height: 165,
        enableInfiniteScroll: false,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
