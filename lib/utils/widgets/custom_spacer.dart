import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSpacer {
  static horizontalSpace(double space) {
    return SizedBox(width: space.w);
  }

  static verticalSpace(double space) {
    return SizedBox(height: space.h);
  }
}
