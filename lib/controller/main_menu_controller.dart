import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../menu/home_page.dart';
import '../menu/feat_page.dart';
import '../menu/profile_page.dart';

class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> listPages = [
     HomePage(),
    FeatPage(),
    ProfilePage(),
  ];
}
