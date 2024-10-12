import 'package:get/get.dart';
import 'package:my_calculator/view/views.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const CalculatorScreen());
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
