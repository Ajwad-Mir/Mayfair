import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTravelExpensesController extends GetxController{
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;

  var nightStayVal1 = false.obs;
  var nightStayVal2 = false.obs;
}