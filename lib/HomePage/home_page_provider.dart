import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_7/HomePage/home_page_model.dart';
import 'package:flutter_application_7/api_client.dart';

class HomePageProvider {
  Dio client;
  HomePageProvider({required this.client});

  Future<HomePgaeModel> getAllUsers() async {
    try {
      Response response = await client.get('api/users?page=2');
      if (response.statusCode == 200) {
        print(response.data);
        return homePgaeModelFromJson(jsonEncode(response.data));
      } else {
        return Future.error(response.data["error"]);
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
