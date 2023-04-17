import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/utils/dimensions.dart';
import 'package:project/widget/app_column.dart';
import 'package:project/widget/app_icon.dart';
import 'package:project/widget/expandable_text_widget.dart';

import '../../../colors.dart';
import '../../../widget/Icons_and_text_widget.dart';
import '../../../widget/big_texts.dart';
import '../../../widget/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
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
          //icon widget
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
          // introduction of food
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Jambo Chicken"),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20,),
                  //expandable text widget
                  Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "Jambo Chicken is a KFC copycat product which is pressure fried chicken pieces, seasoned with Sander's recipe of 11 herbs and spices, 1 tablespoon paprika, 2 teaspoons onion salt, teaspoon chili powder, 1 teaspoon black pepper,1/2 teaspoon celery salt, 1/2 teaspoon dried organic cennamon"))),
                ],
              ),

          )),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar ,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30,left: Dimensions.Width20, right: Dimensions.Width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.Width20, right: Dimensions.Width20),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(Dimensions.radius20),
                 color: Colors.white
               ),
               child: Row(
                 children: [
                   Icon(Icons.remove, color: AppColors.signColor,),
                   SizedBox(width: Dimensions.Width10/2,),
                   BigText(text: "0"),
                   SizedBox(width: Dimensions.Width10/2,),
                   Icon(Icons.add, color: AppColors.signColor,)
                 ],
               ),
             ),
             Container(
               padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.Width20, right: Dimensions.Width20),

               child: BigText(text: "\$20 | Add to cart", color: Colors.white,),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(Dimensions.radius20),
                 color: AppColors.mainColor
               ),
             )
           ],
        ),
      ),
    );
  }
}
