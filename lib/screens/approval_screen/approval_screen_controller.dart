import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApprovalsController extends GetxController with GetSingleTickerProviderStateMixin{
  late TabController tabController;

  var Selected_FromDate = "".obs;
  var Selected_ToDate = "".obs;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
  }
}