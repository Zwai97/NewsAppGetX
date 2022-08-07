import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/news_controller.dart';

class HomePage extends GetView<NewsController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      bottomNavigationBar: GetX<NewsController>(
        builder: (controller) => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (val) => controller.currentIndex.value = val,
            selectedItemColor: Colors.blue,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: 'Sports'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.health_and_safety), label: 'Health'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: 'Science'),
            ]),
      ),
      body: GetX<NewsController>(
        builder: (controller) =>
            controller.screens[controller.currentIndex.value],
      ),
    );
  }
}
