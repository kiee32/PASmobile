import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       title: "Belajar Flutter Getx",
      initialRoute: Routes.login,
      getPages: Routes.myPages,
    );
  
  }
}