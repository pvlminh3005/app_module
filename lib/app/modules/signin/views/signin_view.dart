import 'package:app_module/app/config/extension/validate_extension.dart';
import 'package:app_module/app/cores/value/app_color.dart';
import 'package:app_module/app/cores/value/dimen.dart';
import 'package:app_module/app/cores/value/font_size.dart';
import 'package:app_module/app/widgets/base/custom_button.dart';
import 'package:app_module/app/widgets/base/custom_input.dart';
import 'package:app_module/app/widgets/base/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

final List _itemsSocial = [
  {
    'icon': 'assets/images/ic_facebook.png',
    'color': Color(0xFF1E3799),
  },
  {
    'icon': 'assets/images/ic_twitter.png',
    'color': Color(0xFF3498DB),
  },
  {
    'icon': 'assets/images/ic_google.png',
    'color': Color(0xFFEB2F06),
  },
];

class SigninView extends GetView<SigninController> {
  SigninController get signin => Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLogo(),
          SizedBox(height: AppDimen.spacing_4),
          _buildFormLogin(),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
        ),
        SizedBox(height: AppDimen.spacing_2),
        CustomText(
          'Log In Now',
          margin: EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
          fontWeight: FontWeight.w700,
          fontSize: FontSize.BIG_2,
          align: TextAlign.center,
        ),
        _buildTextSignin('Please login to continue using our app'),
      ],
    );
  }

  Widget _buildFormLogin() {
    return Padding(
      padding: EdgeInsets.all(AppDimen.spacing_2 - 2),
      child: Form(
        key: signin.formKey,
        child: Column(
          children: [
            CustomInput(
              controller: signin.usernameController,
              hintText: 'Email',
              margin: EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
              keyboardType: TextInputType.emailAddress,
              validator: Validator.validateEmail,
            ),
            CustomInput(
              controller: signin.passwordController,
              hintText: 'Password',
              margin: EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
              isPassword: true,
              showSuffix: true,
              validator: Validator.validatePassword,
            ),
            SizedBox(height: AppDimen.spacing_1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildTextSignin(
                  'Forgot password?',
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: AppDimen.spacing_3),
            CustomButton(
              title: 'Log in',
              height: 62.0,
              sizeStyle: CustomBottomSizeStyle.MATCH_PARENT,
              onTap: () async {
                await signin.signinApp();
              },
            ),
            Obx(
              () => CustomText(
                signin.errorText,
                color: kErrorColor,
                margin: EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimen.spacing_2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextSignin('Don\'t have an account?'),
              InkWell(
                onTap: () {},
                child: CustomText(
                  'Sign Up',
                  color: kPrimaryColorLight,
                  fontWeight: FontWeight.w600,
                  margin: EdgeInsets.only(left: AppDimen.spacing_1),
                ),
              ),
            ],
          ),
          CustomText(
            'Or connect with',
            fontSize: FontSize.SMALL + 1,
            color: kTextColorLight,
            fontWeight: FontWeight.w600,
            margin: EdgeInsets.symmetric(vertical: AppDimen.spacing_3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _itemsSocial
                .map(
                  (item) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppDimen.spacing_1),
                    child: CircleAvatar(
                      backgroundColor: item['color'],
                      child: Image.asset(
                        item['icon'],
                        width: 20,
                        height: 22,
                        fit: BoxFit.cover,
                      ),
                      radius: AppDimen.icSizeBig - 2,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextSignin(
    String title, {
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return CustomText(
      title,
      color: kTextColorLight,
      fontWeight: fontWeight,
    );
  }
}
