import 'package:get/get.dart';
import 'package:my_calculator/controllers/controllers.dart';

class RootBinding implements Bindings {
  RootBinding();

  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => CalculatorController());
  }
}
