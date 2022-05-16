import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ExpensesPerDayController extends GetxController{
  var checkedValue = false.obs;
  final TextEditingController MaintenanceChargesController = TextEditingController();
  final TextEditingController FareChargesController = TextEditingController();
  final TextEditingController StaffChargesController = TextEditingController();
  final TextEditingController PhoneChargesController = TextEditingController();
  final TextEditingController InternetChargesController = TextEditingController();
  final TextEditingController CourierChargesController = TextEditingController();
  final TextEditingController PhotostateChargesController = TextEditingController();
  final TextEditingController SamplingChargesController = TextEditingController();
  final TextEditingController OtherChargesController = TextEditingController();


  final TextEditingController MaintenanceNotesController = TextEditingController();
  final TextEditingController FareNotesController = TextEditingController();
  final TextEditingController StaffNotesController = TextEditingController();
  final TextEditingController PhoneNotesController = TextEditingController();
  final TextEditingController InternetNotesController = TextEditingController();
  final TextEditingController CourierNotesController = TextEditingController();
  final TextEditingController PhotostateNotesController = TextEditingController();
  final TextEditingController SamplingNotesController = TextEditingController();
  final TextEditingController OtherNotesController = TextEditingController();
  var totalChargesAmount = "".obs;

  var maintenanceError = false.obs;
  var FareError = false.obs;
  var StaffError = false.obs;
  var PhoneError = false.obs;
  var InternetError = false.obs;
  var CourierError = false.obs;
  var PhotoStateError = false.obs;
  var SamplingError = false.obs;
  var otherError = false.obs;

  void changeAutoFillPriority(bool newValue) {
    if(newValue == false){
      checkedValue.value = newValue;
      MaintenanceChargesController.text = "";
      FareChargesController.text = "";
      StaffChargesController.text = "";
      PhoneChargesController.text = "";
      InternetChargesController.text = "";
      CourierChargesController.text = "";
      PhotostateChargesController.text = "";
      SamplingChargesController.text = "";
      OtherChargesController.text = "";
      totalChargesAmount.value = "";
      maintenanceError.value = false;
      FareError.value = false;
      StaffError.value = false;
      PhoneError.value = false;
      InternetError.value = false;
      CourierError.value = false;
      PhotoStateError.value = false;
      SamplingError.value = false;
      otherError.value = false;
    }
    else{
      checkedValue.value = newValue;
      MaintenanceChargesController.text = "1000";
      FareChargesController.text = "1000";
      StaffChargesController.text = "1000";
      PhoneChargesController.text = "1000";
      InternetChargesController.text = "1000";
      CourierChargesController.text = "1000";
      PhotostateChargesController.text = "1000";
      SamplingChargesController.text = "1000";
      OtherChargesController.text = "1000";
      AddCharges();
    }
  }

  void AddCharges() {
    int Maintenance = (MaintenanceChargesController.text.isEmpty) ? 0 : (int.parse(MaintenanceChargesController.text) > 1000) ? 0 : int.parse(MaintenanceChargesController.text);
    int Fare = (FareChargesController.text.isEmpty) ? 0 : (int.parse(FareChargesController.text) > 1000) ? 0 : int.parse(FareChargesController.text);
    int Staff = (StaffChargesController.text.isEmpty) ? 0 : (int.parse(StaffChargesController.text) > 1000) ? 0 : int.parse(StaffChargesController.text);
    int Phone = (PhoneChargesController.text.isEmpty) ? 0 : (int.parse(PhoneChargesController.text) > 1000) ? 0 : int.parse(PhoneChargesController.text);
    int Internet = (InternetChargesController.text.isEmpty) ? 0 : (int.parse(InternetChargesController.text) > 1000) ? 0 : int.parse(InternetChargesController.text);
    int Courier = (CourierChargesController.text.isEmpty) ? 0 : (int.parse(CourierChargesController.text) > 1000) ? 0 : int.parse(CourierChargesController.text);;
    int PhotoState = (PhotostateChargesController.text.isEmpty) ? 0 : (int.parse(PhotostateChargesController.text) > 1000) ? 0 : int.parse(PhotostateChargesController.text);
    int Sampling = (SamplingChargesController.text.isEmpty) ? 0 : (int.parse(SamplingChargesController.text) > 1000) ? 0 : int.parse(SamplingChargesController.text);
    int others = (OtherChargesController.text.isEmpty) ? 0 : (int.parse(OtherChargesController.text) > 1000) ? 0 :  int.parse(OtherChargesController.text);
    int total = Maintenance + Fare + Staff + Phone + Internet + Courier + PhotoState + Sampling + others;
    print(total.toString());
    totalChargesAmount.value = total.toString();
  }

}