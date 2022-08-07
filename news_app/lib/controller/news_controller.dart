import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/news_model.dart';
import '../view/bottom_nav_bar.dart/health.dart';
import '../view/bottom_nav_bar.dart/science.dart';
import '../view/bottom_nav_bar.dart/sport.dart';

class NewsController extends GetxController {
  RxInt currentIndex = 0.obs;
  List<Widget> screens = const [Sport(), Health(), Science()];
  Future<NewsModel> getData(String cat) async {
    final Uri url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=de&category=$cat&apiKey=077baf91d3f14dc9bfddbe140b6765a1');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return NewsModel.fromJson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }
    return throw Exception('Failed');
  }
}
