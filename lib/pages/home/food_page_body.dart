// ignore_for_file: dead_code

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project/controllers/popular_product_controller.dart';
import 'package:project/utils/colors.dart';
import 'package:project/widget/Icons_and_text_widget.dart';
import 'package:project/widget/big_texts.dart';
import 'package:project/widget/small_text.dart';
import 'package:get/get.dart';
import 'package:project/utils/dimensions.dart';

import '../../widget/app_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  var _scaleFactor = 0.8;
  int index = 0;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider Section
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return Container(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position);
                }
            ),

          );
        }),

        //dots
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        //Popular text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.Width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.Width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.Width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing",),
              )
            ],
          ),
        ),
        //list scroller  of food and images

         ListView.builder(
             physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             itemCount: 10,
             itemBuilder: (context, index){
               return Container(
                 margin: EdgeInsets.only(
                     left: Dimensions.Width20, right: Dimensions.Width20, bottom: Dimensions.height10),
                 child: Row(
                   children: [
                     //Height and width of image section
                     Container(
                       width:Dimensions.listViewTestContSize,
                       height:Dimensions.listViewTestContSize ,

                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(Dimensions.radius20),
                             color: Colors.white38,
                             image: DecorationImage(
                               fit: BoxFit.cover,
                                 image: AssetImage(
                                     "assets/image/chicken.jpg"))
                         )
                     ),
                     
                     //text section
                     Expanded(
                       child: Container(
                         height: Dimensions.listViewTestContSize,

                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.only(
                             topRight: Radius.circular(Dimensions.radius20),
                             bottomRight: Radius.circular(Dimensions.radius20)
                           ),
                           color: Colors.white
                         ),
                         child: Padding(
                           padding: EdgeInsets.only(left: Dimensions.Width10, right: Dimensions.Width10,),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment:  MainAxisAlignment.center,
                             children: [
                               BigText(text: "Chicken Empire"),
                               SizedBox(height: Dimensions.height10,),
                               //SmallText(text: "text"),
                               SizedBox(height: Dimensions.height10,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   IconAndTextWidget(icon: Icons.circle_sharp,
                                       text: "Normal",

                                       iconColor: AppColors.iconColor1),
                                   IconAndTextWidget(icon: Icons.location_on,
                                       text: "1.7km",

                                       iconColor: AppColors.mainColor),
                                   IconAndTextWidget(icon: Icons.access_alarms_rounded,
                                       text: "32min",

                                       iconColor: AppColors.iconColor2)
                                 ],
                               )
                             ],
                           ),
                         )
                       ),
                     )
                   ],

                 ),


               );
             }
         ),

      ],);
  }

    Widget _buildPageItem(int index) {
      Matrix4 matrix = new Matrix4.identity();
      if (index == _currPageValue.floor()) {
        var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
        var currTrans = _height * (1 - currScale) / 2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)
          ..setTranslationRaw(0, currTrans, 0);
      } else if (index == _currPageValue.floor() + 1) {
        var currScale = _scaleFactor +
            (_currPageValue - index + 1) * (1 - _scaleFactor);
        var currTrans = _height * (1 - currScale) / 2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)
          ..setTranslationRaw(0, currTrans, 0);
      } else if (index == _currPageValue.floor() - 1) {
        var currScale = _scaleFactor +
            (_currPageValue - index + 1) * (1 - _scaleFactor);
        var currTrans = _height * (1 - currScale) / 2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)
          ..setTranslationRaw(0, currTrans, 0);
      } else {
        var currScale = 0.8;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)
          ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
      }


      return Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.Width10, right: Dimensions.Width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/image/fries.png"
                      )
                  )

              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: Dimensions.pageViewTextContainer,
                  margin: EdgeInsets.only(left: Dimensions.Width30,
                      right: Dimensions.Width30,
                      bottom: Dimensions.height30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0, 5)
                        ),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5, 0)
                        ),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(5, 0)
                        )
                      ]
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height15, left: 15, right: 15),
                    child: AppColumn(text:"Jambo Chicken" ,),
                  )
              ),
            ),
          ],
        ),
      );
    }
  }

