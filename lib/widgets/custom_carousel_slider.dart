import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  List<String> items = [];
  CustomCarouselSlider({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        height: 190.0,
        aspectRatio: 16 / 12,
      ),
      items: items.map(
        (i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: 420,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(i),
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
