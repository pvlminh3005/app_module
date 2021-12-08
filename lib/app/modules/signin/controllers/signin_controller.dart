import 'package:app_module/app/routes/app_pages.dart';
import 'package:app_module/app/utils/auth_preference.dart';
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

        await AuthPreference.setToken('${usernameController.text}');

        await Future.delayed(2.seconds);
        Get.offAndToNamed(Routes.HOME);
      }
    }
  }

  Future<void> logoutApp() async {
    await Future.delayed(3.seconds);
    await AuthPreference.removeToken();
    await Get.offAndToNamed(Routes.SIGNIN);
  }
}
