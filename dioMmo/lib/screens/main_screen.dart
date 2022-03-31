import 'package:flutter/material.dart';
import 'package:foodapp/service/main_screen_service.dart';

import '../widgets/mainScreenWidgets/circle_game_icon_widget.dart';
import '../widgets/mainScreenWidgets/slider_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

String appBarTitle = "MMO Games";

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 248, 241, 1),
     
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
            
            children: [
              SizedBox(
                height: 60,
              ),
              FutureBuilder(
                future: getMainScreenData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  List sliderImage = [];
                  List circularImage = [];
                  List title = [];
                  List detail = [];
                  List gameType = [];
                  List developer = [];
                  List platform = [];
                  if (snapshot.hasData) {
                    for (int i = 0; i < 11; i++) {
                      sliderImage.add(snapshot.data["gameData"][i]["thumbnail"]);
                    }

                    for (int i = 0; i < 370; i++) {
                      circularImage.add(snapshot.data["gameData"][i]["thumbnail"]);
                      title.add(snapshot.data["gameData"][i]["title"]);
                      detail.add(snapshot.data["gameData"][i]["short_description"]);
                      gameType.add(snapshot.data["gameData"][i]["genre"]);
                      developer.add(snapshot.data["gameData"][i]["developer"]);
                      platform.add(snapshot.data["gameData"][i]["platform"]);
                    }
                   
                    return Container(
                      color: Color.fromRGBO(255, 248, 241, 1),
                      child: Column(
                        children: [
                          HeaderSlider(
                            img: sliderImage,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              3,
                              (index) => CircleGameIcon(
                                detail: detail,
                                cardNumber: index,
                                title: title,
                                icon: circularImage,
                                type: gameType,
                                developer: developer,
                                platform: platform,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
      ),
    );
  }
}
