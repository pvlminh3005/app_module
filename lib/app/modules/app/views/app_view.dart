import 'package:app_module/app/cores/theme/font_family.dart';
import 'package:app_module/app/cores/value/app_color.dart';
import 'package:app_module/app/modules/app/bindings/app_binding.dart';
import 'package:app_module/app/routes/app_pages.dart';
import 'package:app_module/app/utils/auth_preference.dart';
import 'package:app_module/app/widgets/custom_loading.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/app_controller.dart';

class AppView extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: AppBinding(),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: FontFamily.nunitoSans,
      ),
      home: AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    var token = AuthPreference.getToken();
    2.delay(() {
      Get.offAllNamed(
        token != null ? Routes.HOME : Routes.SIGNIN,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
        alignment: Alignment.center,
        child: CustomLoading(
          color: kPrimaryColor,
          width: 3,
        ),
      ),
    );
  }
}
