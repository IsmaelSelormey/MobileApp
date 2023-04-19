import 'package:project/home.dart';
import 'package:project/pages/home/main_food_page.dart';
import 'package:project/reusablewidgets/reusablewidgets.dart';
import 'package:project/signup.dart';
import 'package:project/utils/colour_utils.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.08, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/image/img1.png"),
                SizedBox(
                  height: 15,
                ),
                 Align(
            alignment: Alignment.centerLeft,
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.w800,),
                ),),
                 Align(
            alignment: Alignment.centerLeft,
                child: const Text(
                  "Log into your account",
                  style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w400),
                ),),
                SizedBox(
                  height: 50,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false,
                    _emailTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController,),
                    SizedBox(
                  height: 5,),
                 Align(
            alignment: const Alignment(0.9, 0),
            child: const Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w600),
            ),),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainFoodPage()));
                }),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpView()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
