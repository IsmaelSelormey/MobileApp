import 'package:delivery_app/home.dart';
import 'package:delivery_app/onboarding_screen.dart';
import 'package:delivery_app/signin.dart';
import 'package:delivery_app/signup.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
      home: OnboardingView(),
      // home: SignUpView(),
      // home: SignInView(),
      // home: HomeView(),
    )
  );
}