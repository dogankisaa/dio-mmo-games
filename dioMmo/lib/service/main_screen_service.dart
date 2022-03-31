import 'dart:math';

import 'package:dio/dio.dart';

Dio dio = Dio();

getMainScreenData() async {
  Response response = await dio.get("https://www.mmobomb.com/api1/games");
  var responseData = {"gameData": response.data};
  return (responseData);
}
