import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HeaderSlider extends StatelessWidget {
  
  final img;
  const HeaderSlider({
    Key? key,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11, top: 25),
      child: Container(
        height: 230,
        child: CarouselSlider(
          options: CarouselOptions(
            height: double.infinity,
            autoPlay: true,
            viewportFraction: 1,
          ),
          items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(img[i]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Container());
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}