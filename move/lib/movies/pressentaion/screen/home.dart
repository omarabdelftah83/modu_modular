import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/utiles/app_constance.dart';
import '../widgit/Custom_Row_three_point.dart';
import '../widgit/custom_outLine_circle.dart';
import '../widgit/custom_outline_elevetedbutton.dart';
import '../widgit/custom_position _color_pink.dart';
import '../widgit/custom_position_color_green.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppConstance.black,
      body: SingleChildScrollView(
        child: Container(
          height: screenHight,
          width: screenWidth,
          child: Stack(
            children: [
              //position1//
              CustomPositionToColorpink(),
              //position2//
              CustomPositionColorGreen(),
              //circle//
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHight * 0.1,
                    ),
                    //circle//
                   // CustomOutLineCircle(),
                    SizedBox(
                      height: screenHight * 0.08,
                    ),
                    Text(
                      'watch movies in \n virtual reality',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: screenHight <= 660 ? 18 : 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: screenHight * 0.08,
                    ),
                    //Eleveted Button//
                    CustomOutLineElevetedButton(),
                    SizedBox(
                      height: 30,
                    ),
                    //three point//
                    CustomThreePoint(),
                    SizedBox(
                      height: screenHight * 0.06,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
