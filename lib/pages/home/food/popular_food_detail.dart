import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/controllers/popular_product_controller.dart';
import 'package:project/pages/home/main_food_page.dart';
import 'package:project/utils/app_constants.dart';
import 'package:project/utils/dimensions.dart';
import 'package:project/widget/app_column.dart';
import 'package:project/widget/app_icon.dart';

import '../../../colors.dart';
import '../../../widget/Icons_and_text_widget.dart';
import '../../../widget/big_texts.dart';
import '../../../widget/expandable_text_widget.dart';
import '../../../widget/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product= Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct();
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
                  image: NetworkImage(
                    AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
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
                  GestureDetector(
                    onTap:(){
                      Get.to(()=>MainFoodPage());
                      },
                      child:
                  AppIcon(icon: Icons.arrow_back_ios)),
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

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name!),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20,),
                  //expandable text widget
                  Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text:product.description!))),
                ],
              ),


          )),
        ],
      ),


      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popuplarProduct){
        return Container(
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
                    GestureDetector(
                        onTap: (){
                          popuplarProduct.setQuantity(false);

                        },
                        child: Icon(Icons.remove, color: AppColors.signColor,)),
                    SizedBox(width: Dimensions.Width10/2,),
                    BigText(text: popuplarProduct.quantity.toString()),
                    SizedBox(width: Dimensions.Width10/2,),
                    GestureDetector(
                        onTap: (){
                          popuplarProduct.setQuantity(true);

                        },
                        child: Icon(Icons.add, color: AppColors.signColor,))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.Width20, right: Dimensions.Width20),

                child: BigText(text: "\$ ${product.price!} | Add to cart", color: Colors.white,),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor
                ),
              )
            ],
          ),
        );
      },)

    );
  }
}
