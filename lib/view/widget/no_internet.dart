import 'package:add_to_cart/utils/colors.dart';
import 'package:add_to_cart/utils/text_styles.dart';
import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetWidget extends StatelessWidget {
  final dynamic onPressed;
  NoInternetWidget({Key? key,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Container(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnyImageView(
                      height: 120.h,
                      width: 120.w,
                     imagePath:  "assets/internet.json",

                      boxFit: BoxFit.fill,),

                  SizedBox(height: 30.h,),

                  Text("No internet !!!",style: TextStyles.body1Strong(AppColors.primaryColor),),
                  SizedBox(height: 5.h,),
                  Text("Please Check your internet connection",style: TextStyles.body1Strong(AppColors.primaryColor),),
                  SizedBox(height: 20.h,),

                  ElevatedButton(child:Text( 'Try Again'), onPressed: onPressed)

                ],
              ),
            ],
          ))),
    );
  }
}