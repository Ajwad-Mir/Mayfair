import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mayfair/export.dart';

class AddTravelExpensesWRTDate extends GetView<AddTravelExpensesWRTDateController>{
  var date = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTravelExpensesController>(
      builder: (_) =>Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 28.w,right: 28.w,top: 20.h,bottom: 24.h),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: appColors.grey,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 27.h
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 112.w,
                          ),
                          Text(
                            DateFormat.yMMMd().format(date).toString(),
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: appColors.black
                            ),
                          ),
                          SizedBox(
                            width: 79.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.close)
                            ),
                          ),
                          SizedBox(
                            width: 19.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 16.w,
                          height: 16.h,
                          child: Obx(() => Checkbox(
                            value: controller.nightStayPerDay.value,
                            onChanged: (bool? value) {
                              controller.nightStayPerDay.value = value!;
                              if(controller.nightStayPerDay.isTrue){
                                controller.NightStay.value = "1000";
                              }
                              else{
                                controller.NightStay.value = "0";
                              }
                              controller.calculateTotal();
                            },
                          ),
                        )),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          'Night Stay',
                          style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: appColors.black
                          ),
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h
                    ),
                    Container(
                      width: 326.w,
                      decoration: BoxDecoration(
                        color: appColors.white,
                        border: Border.all(
                          color: appColors.borderColor,
                          width: 0.3
                        ),
                        borderRadius: BorderRadius.circular(4.0)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Obx(() => DropdownButtonHideUnderline(
                        child: DropdownButton(
                            hint: controller.LocationValue.value == "Travelled To"
                                ? Text('Travelled To')
                                : Text(
                              controller.LocationValue.value,
                              style: TextStyle(color: Colors.blue),
                            ),
                            isExpanded: true,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            onChanged: (value) {
                              controller.LocationValue.value = value!.toString();
                              controller.TravelledKM.value = "1000";
                              controller.TravelExpenses.value = "1000";
                              controller.TravelDailyAllowance.value = "1000";
                              controller.calculateTotal();
                            },
                            items: controller.items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13.h
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "or",
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: appColors.TextHint
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h
                    ),
                    Container(
                      width: 326.w,
                      decoration: BoxDecoration(
                          color: appColors.white,
                          border: Border.all(
                              color: appColors.borderColor,
                              width: 0.3
                          ),
                          borderRadius: BorderRadius.circular(4.0)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: TextFormField(
                        enabled: (controller.LocationValue.value == "Travelled To") ? true : false,
                        controller: controller.CityController,
                        // onChanged: (value) {
                        //   controller.TravelDailyAllowance.value = "1000";
                        //   controller.calculateTotal();
                        // },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type Traveled to Station Name",

                          hintStyle: GoogleFonts.inter(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: appColors.TextHint
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 20.h
                    ),
                    Container(
                      width: 326.w,
                      decoration: BoxDecoration(
                          color: appColors.white,
                          border: Border.all(
                              color: appColors.borderColor,
                              width: 0.3
                          ),
                          borderRadius: BorderRadius.circular(4.0)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: TextFormField(
                        enabled: (controller.LocationValue.value == "Travelled To") ? true : false,
                        controller: controller.KmController,
                        keyboardType: TextInputType.number,
                        // onChanged: (value) {
                        //   controller.TravelledKM.value = (int.parse(controller.KmController.text)).toString();
                        //   controller.calculateTotal();
                        // },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Km",
                          hintStyle: GoogleFonts.inter(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: appColors.TextHint
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 20.h
                    ),
                    Container(
                      width: 326.w,
                      decoration: BoxDecoration(
                          color: appColors.white,
                          border: Border.all(
                              color: appColors.borderColor,
                              width: 0.3
                          ),
                          borderRadius: BorderRadius.circular(4.0)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: TextFormField(
                        enabled: (controller.LocationValue.value == "Travelled To") ? true : false,
                        controller: controller.FuelExpensesController,
                        // onChanged: (value) {
                        //   controller.TravelExpenses.value = (int.parse(controller.FuelExpensesController.text) * int.parse(controller.TravelledKM.toString())).toString();
                        //   controller.calculateTotal();
                        // },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Fuel Expense Per Km",
                          hintStyle: GoogleFonts.inter(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: appColors.TextHint
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 20.h
                    ),
                    Container(
                      width: 326.w,
                      height: 128.h,
                      decoration: BoxDecoration(
                          color: appColors.white,
                          border: Border.all(
                              color: appColors.borderColor,
                              width: 0.3
                          ),
                          borderRadius: BorderRadius.circular(4.0)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: TextFormField(
                        enabled: (controller.LocationValue.value == "") ? true : false,
                        controller: controller.NotesController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Write Note, if not traveled from base town",
                          hintStyle: GoogleFonts.inter(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: appColors.TextHint
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Travelled Km",
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: appColors.TextHint
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Obx(() => Container(
                          width: 30.w,
                          alignment: Alignment.centerRight,
                          child: Text(
                              controller.TravelledKM.value,
                              style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: appColors.TextHint
                              ),
                            ),
                        ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Travel Expenses",
                            style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: appColors.TextHint
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Obx(() => Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            controller.TravelExpenses.value,
                            style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: appColors.TextHint
                              ),
                            ),
                        ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Night Stay",
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: appColors.TextHint
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Obx(() => Container(
                          width: 30.w,
                          alignment: Alignment.centerRight,
                          child: Text(
                            controller.NightStay.value,
                            style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: appColors.TextHint
                              ),
                            ),
                        ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Travelling Daily Allowances",
                            style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: appColors.TextHint
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Obx(() => Container(
                          width: 30.w,
                          alignment: Alignment.centerRight,
                          child: Text(
                            controller.TravelDailyAllowance.value,
                            style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: appColors.TextHint
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 215.5.w,
                          child: Divider(
                            thickness: 2.0,
                            color: appColors.dividerColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Grand Total",
                          style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: appColors.TextHint
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Obx(() => Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            controller.GrandTotal.value,
                            style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: appColors.TextHint
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      width: 141.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: appColors.gradientColor1,
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                          Get.snackbar('Success', 'Data Entered Successfully',backgroundColor: appColors.black,colorText: appColors.white);
                        },
                        child: Text(
                          "Submit",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: appColors.white,
                          ),
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}