import 'dart:ui';
import 'package:project/reusablewidgets/reusablewidgets.dart';
import 'package:project/pages/splash screen/signup.dart';
import 'package:project/pages/splash screen/signin.dart';
import 'package:project/utils/colour_utils.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.08, 20, 0),
                    child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          children: <Widget>[
                logoWidget("assets/image/img1.png"),
                SizedBox(
                  height: 50,
                ),
                            Align(
            alignment: Alignment.centerLeft,
                child: const Text(
                  "Hello!",
                  style: TextStyle(color: Colors.white, fontSize: 55, fontWeight: FontWeight.w800,),
                ),),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Welcome to ******* Deliveries",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                  height: 20,
                ),
                          ],
                        ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06),
                        SizedBox(
                          height: 50,
                          width: 310,
                          child: ElevatedButton(
                            style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                              backgroundColor: MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInView()));
                            },
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                        SizedBox(
                          height: 50,
                          width: 310,
                          child: ElevatedButton(
                            style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                              side: MaterialStateProperty.all(
                                BorderSide(color: Colors.white)),
                              backgroundColor: MaterialStateProperty.all(
                                Colors.transparent)),
                            onPressed: () {
                              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpView()));
                            },
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            ),
                        )
                    ],
                  ),
                  )),
                ),
    );
  }
}
