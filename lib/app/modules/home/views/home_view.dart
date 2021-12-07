import 'package:app_module/app/cores/value/app_color.dart';
import 'package:app_module/app/cores/value/dimen.dart';
import 'package:app_module/app/cores/value/font_size.dart';
import 'package:app_module/app/widgets/base/custom_text.dart';
import 'package:app_module/app/widgets/custom_loading.dart';
import 'package:app_module/app/widgets/email_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeController get home => Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.7),
      body: RefreshIndicator(
        onRefresh: () async {
          await home.fetchData();
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppDimen.radiusBig_1),
                  bottomRight: Radius.circular(AppDimen.radiusBig_1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderTitle(),
                  Container(
                    height: 150,
                    padding: EdgeInsets.all(AppDimen.spacing_1),
                    child: Obx(
                      () {
                        if (home.isLoading)
                          return CustomLoading(width: 3);
                        else
                          return Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              ...List.generate(
                                2,
                                (index) => _buildStackSlide(
                                  10 * (index + 1),
                                  context,
                                  index,
                                ),
                              ).toList(),
                              Positioned(
                                child: EmailItem(
                                  email: home.listEmails[0],
                                  type: EmailType.Stack,
                                ),
                              ),
                            ],
                          );
                      },
                    ),
                  ),
                ],
              ),
            ),
            _buildListEmail(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppDimen.spacing_1,
        horizontal: AppDimen.spacing_2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimen.spacing_3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'All Emails',
                  fontSize: FontSize.BIG_1,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                CustomText(
                  'You have got 3 new emails',
                  color: Colors.white,
                  margin: EdgeInsets.only(top: AppDimen.spacing_1),
                ),
              ],
            ),
          ),
          CircleAvatar(
            child: Icon(
              Icons.add,
              color: kColorGrey,
              size: AppDimen.icSizeBig,
            ),
            backgroundColor: Colors.white,
            radius: AppDimen.icSizeBig,
          ),
        ],
      ),
    );
  }

  Widget _buildListEmail() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(AppDimen.spacing_1),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Obx(
              () {
                if (home.isLoading) {
                  return CustomLoading(width: 3);
                }
                return ListView.builder(
                  controller: home.scrollController,
                  itemCount: home.listEmails.length,
                  itemBuilder: (BuildContext context, int index) {
                    return EmailItem(email: home.listEmails[index]);
                  },
                );
              },
            ),
            Obx(
              () {
                if (home.isLoadingInfinity)
                  return CustomLoading(color: kPrimaryColor, width: 3);
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStackSlide(double top, BuildContext context, int index) {
    return Positioned(
      top: top,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 110.0,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(1 - .35 * (index + 1)),
          borderRadius: BorderRadius.circular(AppDimen.radiusBig - .3 * top),
        ),
        width: MediaQuery.of(context).size.width - 2.8 * (top),
      ),
    );
  }
}
