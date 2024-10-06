import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_calculator/controllers/controllers.dart';
import 'package:my_calculator/utils/utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.blackColor,
      body: GetBuilder(
          init: SplashScreenController(),
          builder: (controller) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText.whiteColor30Bold(text: StringConstants.appName),
                  CustomSpacer.verticalSpace(10),
                  Text(
                    "by Rahil Shaikh",
                    style: GoogleFonts.satisfy(
                      fontSize: 16.sp,
                      color: ColorConstant.primaryColor,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
