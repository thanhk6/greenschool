import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:green_school/ui/home/widget/small_card.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        SmallCard(image: 'assets/images/card01.jpeg'),
        SmallCard(image: 'assets/images/card02.jpeg'),
        SmallCard(image: 'assets/images/card03.jpeg'),
      ],
      options: CarouselOptions(
        height: 120.0,
        enlargeCenterPage: true,
        autoPlay: false,
        aspectRatio: 16 / 9,
        enableInfiniteScroll: true,
        viewportFraction: 0.6,
      ),
    );
  }
}
