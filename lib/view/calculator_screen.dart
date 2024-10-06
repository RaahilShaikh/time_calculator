import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_calculator/controllers/controllers.dart';
import 'package:my_calculator/utils/utils.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<CalculatorController>(
          init: CalculatorController(),
          builder: (controller) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 10.h),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomRight,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        padding: EdgeInsets.all(5.sp),
                        child: Scrollbar(
                          thumbVisibility: true,
                          radius: Radius.circular(5.r),
                          child: SingleChildScrollView(
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.bottomRight,
                              padding: EdgeInsets.only(right: 15.w),
                              child: CustomText.lightGreyColor20Medium(
                                text: controller.history.value,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomSpacer.verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.lightGreyColor20Medium(
                          text: controller.count.value.toString(),
                        ),
                        CustomText.whiteColor50Bold(
                          text: controller.displayValue.value,
                        ),
                      ],
                    ),
                    CustomSpacer.verticalSpace(30),

                    /// 1st row
                    Row(
                      children: [
                        /// lbl 7
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lblAC,
                            color: ColorConstant.lightGreyColor,
                            textColor: ColorConstant.blackColor,
                            onTap: () => controller.allClear(),
                          ),
                        ),
                        CustomSpacer.horizontalSpace(10),

                        Expanded(
                          child: Row(
                            children: [
                              /// lbl c
                              Expanded(
                                child: CustomButton(
                                  title: StringConstants.lblC,
                                  color: ColorConstant.lightGreyColor,
                                  textColor: ColorConstant.blackColor,
                                  onTap: () => controller.clear(),
                                ),
                              ),
                              CustomSpacer.horizontalSpace(10),

                              /// lbl division
                              Expanded(
                                child: CustomButton(
                                  title: StringConstants.lblDivision,
                                  color: ColorConstant.primaryColor,
                                  onTap: () => controller.setOperator(StringConstants.lblDivision),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomSpacer.verticalSpace(10),

                    /// 1st row
                    Row(
                      children: [
                        /// lbl 7
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lbl7,
                            onTap: () => controller.addNumber(StringConstants.lbl7),
                          ),
                        ),
                        CustomSpacer.horizontalSpace(10),

                        /// lbl 8
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lbl8,
                            onTap: () => controller.addNumber(StringConstants.lbl8),
                          ),
                        ),
                        CustomSpacer.horizontalSpace(10),

                        /// lbl 9
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lbl9,
                            onTap: () => controller.addNumber(StringConstants.lbl9),
                          ),
                        ),
                        CustomSpacer.horizontalSpace(10),

                        /// lbl multiplication
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lblMultiplication,
                            color: ColorConstant.primaryColor,
                            onTap: () => controller.setOperator(StringConstants.lblMultiplication),
                          ),
                        ),
                      ],
                    ),
                    CustomSpacer.verticalSpace(10),

                    /// 2nd row
                    Row(
                      children: [
                        /// lbl 4
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lbl4,
                            onTap: () => controller.addNumber(StringConstants.lbl4),
                          ),
                        ),
                        CustomSpacer.horizontalSpace(10),

                        /// lbl 5
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lbl5,
                            onTap: () => controller.addNumber(StringConstants.lbl5),
                          ),
                        ),
                        CustomSpacer.horizontalSpace(10),

                        /// lbl 6
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lbl6,
                            onTap: () => controller.addNumber(StringConstants.lbl6),
                          ),
                        ),
                        CustomSpacer.horizontalSpace(10),

                        /// lbl minus
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lblMinus,
                            color: ColorConstant.primaryColor,
                            onTap: () => controller.setOperator(StringConstants.lblMinus),
                          ),
                        ),
                      ],
                    ),
                    CustomSpacer.verticalSpace(10),

                    /// 3rd row
                    Row(
                      children: [
                        /// lbl 1
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lbl1,
                            onTap: () => controller.addNumber(StringConstants.lbl1),
                          ),
                        ),
                        CustomSpacer.horizontalSpace(10),

                        /// lbl 2
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lbl2,
                            onTap: () => controller.addNumber(StringConstants.lbl2),
                          ),
                        ),
                        CustomSpacer.horizontalSpace(10),

                        /// lbl 3
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lbl3,
                            onTap: () => controller.addNumber(StringConstants.lbl3),
                          ),
                        ),
                        CustomSpacer.horizontalSpace(10),

                        /// lbl plus
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lblPlus,
                            color: ColorConstant.primaryColor,
                            onTap: () => controller.setOperator(StringConstants.lblPlus),
                          ),
                        ),
                      ],
                    ),
                    CustomSpacer.verticalSpace(10),

                    /// 4th row
                    Row(
                      children: [
                        /// lbl 0
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lbl0,
                            onTap: () => controller.addNumber(StringConstants.lbl0),
                          ),
                        ),
                        CustomSpacer.horizontalSpace(10),

                        /// lbl equal to
                        Expanded(
                          child: CustomButton(
                            title: StringConstants.lblEqualTo,
                            color: ColorConstant.primaryColor,
                            onTap: () => controller.calculateTime(),
                          ),
                        ),
                      ],
                    ),
                    CustomSpacer.verticalSpace(10),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? textColor;
  final Function() onTap;
  const CustomButton({
    super.key,
    required this.title,
    this.color,
    this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80.sp,
        decoration: BoxDecoration(
          color: color ?? ColorConstant.darkGreyColor,
          // borderRadius: BorderRadius.circular(80.sp)
          // shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: CustomText.whiteColor30Bold(
          text: title,
          color: textColor,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icons;
  final Color? color;
  final Function() onTap;
  const CustomIconButton({
    super.key,
    required this.icons,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.sp,
        width: 80.sp,
        decoration: BoxDecoration(
          color: color ?? ColorConstant.darkGreyColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(icons));
  }
}
