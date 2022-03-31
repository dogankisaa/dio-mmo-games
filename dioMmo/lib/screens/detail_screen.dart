import 'package:flutter/material.dart';

import 'main_screen.dart';

class DetailScreen extends StatefulWidget {
  final dynamic image;
  final detail;
  final name;
  final type;
  final developer;
  final platform;
  const DetailScreen({Key? key, required this.image, this.detail, this.name, this.type, this.developer, this.platform})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
 
 
  @override
  Widget build(BuildContext context) {
     String appBarTitle = widget.name;
    return Scaffold(
      
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              MainImage(widget: widget),
              SizedBox(
                height: 10,
              ),
              TextWidget(
                text: widget.name,
                isBold: true,
                size: 30,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DetailBox(
                    title: "Type",
                    detail: widget.type,
                  ),
                  DetailBox(
                    title: "Developer",
                    detail: widget.developer
                  ),
                  DetailBox(
                    title: "Platform",
                    detail: widget.platform,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextWidget(
                  text: widget.detail,
                  isBold: false,
                  size: 15,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ));
  }
}

class DetailBox extends StatelessWidget {
  final title;
  final detail;
  const DetailBox({
    Key? key, this.title, this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 65,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color.fromRGBO(255, 146, 44, 1),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
         
           TextWidget(
                  text: title,
                  color: Color.fromRGBO(255, 146, 44, 1),
                  size: 14,
                  isBold: false,
                ),
                SizedBox(
                  height: 5,
                ),
           TextWidget(
                  text: detail,
                  color: Colors.black,
                  size: 16,
                  isBold: false,
                ),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final text;
  final size;
  final isBold;
  final color;
  const TextWidget({
    Key? key,
    this.text,
    this.size,
    this.isBold,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size.toDouble(),
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }
}

class MainImage extends StatelessWidget {
  const MainImage({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.image),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: Colors.white, width: 5),
            borderRadius: BorderRadius.circular(180)),
      ),
    );
  }
}
