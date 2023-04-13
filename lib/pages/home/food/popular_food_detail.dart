import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/utils/dimensions.dart';
import 'package:project/widget/app_column.dart';
import 'package:project/widget/app_icon.dart';

import '../../../colors.dart';
import '../../../widget/Icons_and_text_widget.dart';
import '../../../widget/big_texts.dart';
import '../../../widget/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/chicken.jpg"
                  )
                )
              ),
            ),
          ),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.Width20,
              right:Dimensions.Width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_checkout_outlined)

                ],

          )),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize,
            child: Container(
            padding: EdgeInsets.only(left: Dimensions.Width20, right: Dimensions.Width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: AppColumn(text: "Jambo Chicken",) ,

          )),
        ],
      ),
    );
  }
}
