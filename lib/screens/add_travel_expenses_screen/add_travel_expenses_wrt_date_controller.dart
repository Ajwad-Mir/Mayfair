import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTravelExpensesWRTDateController extends GetxController{
  var nightStayPerDay = false.obs;
  var items = [
    'Gujranwala',
    'Faisalabad',
    'Karachi',
    'Lahore',
    'Islamabad',
    'Rawalpindi',
  ];
  var LocationValue = "Travelled To".obs;

  final TextEditingController CityController = TextEditingController();
  final TextEditingController KmController = TextEditingController();
  final TextEditingController FuelExpensesController = TextEditingController();
  final TextEditingController NotesController = TextEditingController();


  var TravelledKM = "".obs;
  var TravelExpenses = "".obs;
  var NightStay = "".obs;
  var TravelDailyAllowance = "".obs;
  var GrandTotal = "".obs;

  calculateTotal() {
    int Travelled_Km = (TravelledKM.value == "") ? 0 : int.parse(TravelledKM.value);
    int Travel_Expenses = (TravelExpenses.value == "") ? 0 : int.parse(TravelExpenses.value);
    int Night_Stay = (NightStay.value == "") ? 0 : int.parse(NightStay.value);
    int Travel_Daily_Allowance = (TravelDailyAllowance.value == "") ? 0 : int.parse(TravelDailyAllowance.value);
    int Grand_Total = Travelled_Km + Travel_Expenses + Travel_Daily_Allowance + Night_Stay;
    GrandTotal.value = Grand_Total.toString();
  }
}