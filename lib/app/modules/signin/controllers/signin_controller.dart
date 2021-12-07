import 'package:app_module/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  var _errorText = ''.obs;
  String get errorText => _errorText.value;

  @override
  void onInit() {
    super.onInit();

    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
  }

  Future<void> signinApp() async {
    Get.focusScope?.unfocus();
    if (formKey.currentState!.validate()) {
      if (usernameController.text != 'ad@gmail.com' ||
          passwordController.text != '123456') {
        _errorText.value = 'Email or Password not correct';
        return;
      } else {
        _errorText.value = '';
        await Future.delayed(3.seconds);
        Get.offAndToNamed(Routes.HOME);
      }
    }
  }
}
