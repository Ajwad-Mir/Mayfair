import 'package:get/get.dart';
import 'package:mayfair/export.dart';

class Appbindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ApprovalsController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => TravelExpensesController());
    Get.lazyPut(() => AddTravelExpensesController());
    Get.lazyPut(() => AddTravelExpensesWRTDateController());
    Get.lazyPut(() => ExpensesPerDayController());
  }

}