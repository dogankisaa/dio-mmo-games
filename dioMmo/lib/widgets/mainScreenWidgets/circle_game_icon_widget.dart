import 'dart:math';

import 'package:flutter/material.dart';

import '../../screens/detail_screen.dart';

class CircleGameIcon extends StatelessWidget {
  final title;
  final cardNumber;
  final icon;
  final detail;
  final type;
  final developer;
  final platform;
  const CircleGameIcon({
    Key? key,
    this.icon,
    this.cardNumber, this.title, this.detail, this.type, this.developer, this.platform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color.fromRGBO(255, 255, 255, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
          children: List.generate(
        3,
        (index) {
          if (cardNumber == 1) {
            index *= 6;
            if (index == 0) {
              index = Random().nextInt(200);
            }
          } else if (cardNumber == 2) {
            index *= 2;
            if (index == 0) {
              index = Random().nextInt(200);
            }
          } else if (cardNumber == 3) {
            index *= 15;
            if (index == 0) {
              index = Random().nextInt(200);
            }
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(180),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(255, 146, 44, 1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: (() {
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  image: icon[index],
                                  detail:detail[index],
                                  name: title[index],
                                  type: type[index],
                                  developer: developer[index],
                                  platform: platform[index],
                                )),
                      );
                  }),
                  child: Container(
                    width: 78,
                    height: 78,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(icon[index]),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(180)),
                  ),
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}