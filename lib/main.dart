import 'package:flutter/material.dart';
import 'package:project/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:project/onboarding_screen.dart';
import 'package:project/pages/home/food/popular_food_detail.dart';
import 'package:project/pages/home/food/recommended_food_detail.dart';
import 'package:project/signin.dart';
import 'package:project/signup.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommence App',
      theme: ThemeData(

        primarySwatch: Colors.brown,
      ),
      home: RecommendedFoodDetail(),
    );
  }
}
