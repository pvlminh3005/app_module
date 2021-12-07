import 'package:app_module/app/config/api/email_api.dart';
import 'package:app_module/app/data/model/email_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late ScrollController scrollController;

  var _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  var _isLoadingInfinity = false.obs;
  bool get isLoadingInfinity => _isLoadingInfinity.value;

  var _listEmails = <EmailModel>[].obs;
  List<EmailModel> get listEmails => _listEmails;
  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          _isLoadingInfinity == false) {
        await addInfinityData();
      }
    });

    fetchData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
  }

  Future fetchData() async {
    _isLoading.value = true;
    var data = await EmailApi.fetchEmails();
    _listEmails.assignAll(data);
    _isLoading.value = false;
  }

  Future addInfinityData() async {
    _isLoadingInfinity.value = true;
    var data = await EmailApi.fetchEmails();
    _listEmails.addAll(data);
    _isLoadingInfinity.value = false;
  }
}
