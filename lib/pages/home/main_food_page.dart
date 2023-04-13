import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/widget/big_texts.dart';

import 'package:project/utils//colors.dart';
import 'package:project/utils/dimensions.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key:key);
  
  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is "+ MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.Width20, right: Dimensions.Width20),
                margin: EdgeInsets.only(top:Dimensions.height45, bottom: Dimensions.height15 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              BigText(text: "CapeCoast", color: AppColors.mainColor),
                              Icon(Icons.arrow_drop_down)
                            ],
                          )

                        ],
                      ),
                      Center(
                        child: Container(
                            width: Dimensions.height45,
                          height: Dimensions.height45,
                          child: Icon(Icons.search, color: Colors.white, size:Dimensions.iconSize24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius15),
                            color: AppColors.mainColor,

                          ),
                        ),
                      )
                    ],
                  )
              )
          ),
          //showing the body
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          ))
        ],
      )
    );
  }
}

