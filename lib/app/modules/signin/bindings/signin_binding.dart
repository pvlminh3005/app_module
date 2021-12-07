import 'package:app_module/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(
      () => SigninController(),
    );
  }
}
