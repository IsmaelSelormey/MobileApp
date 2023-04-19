import 'package:flutter/material.dart';
import 'package:project/controllers/popular_product_controller.dart';
import 'package:project/data/repository/popular_product_repo.dart';
import 'package:project/pages/home/food_page_body.dart';
import 'package:project/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:project/onboarding_screen.dart';
//import 'package:project/pages/home/food/popular_food_detail.dart';
import 'package:project/pages/home/food/recommended_food_detail.dart';
import 'package:project/signin.dart';
import 'package:project/signup.dart';
import 'helper/dependencies.dart' as dep;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommence App',
      theme: ThemeData(

        primarySwatch: Colors.brown,
      ),
      home:OnboardingView(),
    );
  }
}
