import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mayfair/export.dart';

class ExpensesPerDayScreen extends GetView<ExpensesPerDayController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var date = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExpensesAppBar(scaffoldKey: _scaffoldKey, date: date),
      backgroundColor: appColors.white,
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      drawerScrimColor: appColors.transparent,

      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Column(
            children: [
              SizedBox(
                height: 29.h,
              ),
              getHeadQuartersTownExpensesHeading(),
              SizedBox(
                height: 15.h,
              ),
              getAutofillBox(),
              SizedBox(
                height: 14.h,
              ),
              getData(context),
              SizedBox(
                height: 15.h,
              ),
              getTotalCharges(),
              SizedBox(
                height: 24.h,
              ),
              getUpdateButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget getHeadQuartersTownExpensesHeading() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          appConstants.headQuarterHeading,
          style:
          GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget getAutofillBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 31.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(() => Checkbox(
              value: controller.checkedValue.value,
              activeColor: appColors.gradientColor1,
              onChanged: (bool? value) {
                controller.changeAutoFillPriority(value!);
              },
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            appConstants.autoFill,
            style: GoogleFonts.inter(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: appColors.black),
          )
        ],
      ),
    );
  }

  Widget getData(BuildContext context) {
    return Container(
      width: 372.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: appColors.grey,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6.0,
            color: Color.fromRGBO(0, 0, 0, 0.04)
          )
        ]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: Column(
          children: [
            SizedBox(
              height: 22.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Maintenance",
                  style: GoogleFonts.inter(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: (controller.maintenanceError.isTrue)
                      ? appColors.gradientColor1
                      : appColors.black
                  ),
                ),
                Row(
                  children: [
                    Container(
                        width: 88.w,
                        height: 21.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: appColors.borderColor,
                            width: 0.5
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                          color: appColors.white,
                        ),
                        child: TextFormField(
                            controller: controller.MaintenanceChargesController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            onChanged: (newValue) {
                              if(controller.MaintenanceChargesController.text.isEmpty){
                                controller.maintenanceError.value = false;
                                controller.AddCharges();
                              }
                              else{
                                if (int.parse(controller
                                    .MaintenanceChargesController.text) >
                                    1000) {
                                  controller.maintenanceError.value = true;
                                  controller.AddCharges();
                                } else {
                                  controller.maintenanceError.value = false;
                                  controller.AddCharges();
                                }
                              }
                            },
                            style: GoogleFonts.inter(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            )
                        )
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    InkWell(
                      onTap: (controller.maintenanceError.isFalse) ? null : () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: appColors.white.withOpacity(0.85),
                          builder: (BuildContext context) {
                            return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                content: Container(
                                  width: 372.w,
                                  height: 331.h,
                                  color: appColors.grey,
                                  child: Column(
                                      children: [
                                        SizedBox(
                                            height: 18.h
                                        ),
                                        Container(
                                            width: 372.w,
                                            height: 21.h,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    width: 90.w
                                                ),
                                                Text(
                                                  "Over Limit Expense Note",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: 66.w
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Ink(
                                                    width: 20.w,
                                                    height: 20.h,
                                                    child: Icon(
                                                      Icons.close,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                        SizedBox(
                                          height: 32.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 22.w,right: 24.w),
                                          child: Container(
                                            width: 328.w,
                                            height: 147.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.white,
                                            ),
                                            child: TextFormField(
                                              maxLines: null,
                                              minLines: null,
                                              expands: true,
                                              controller: controller.MaintenanceNotesController,
                                              style: GoogleFonts.inter(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              )
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Container(
                                            width: 141.w,
                                            height: 52.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.gradientColor1,
                                            ),
                                            child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Get.snackbar('Success', 'Added Maintenance Notes');
                                                },
                                                child: Text(
                                                    "Submit",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: appColors.white,
                                                    )
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                )
                            );
                          },
                        );
                      },
                      splashColor: Colors.black.withOpacity(0.4),
                      splashFactory: InkRipple.splashFactory,
                      child: Image.asset(
                        appAssets.userNotes,
                        width: 20.w,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fare/Tail/Toll Taxx/Road",
                  style: GoogleFonts.inter(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: (controller.FareError.isTrue)
                          ? appColors.gradientColor1
                          : appColors.black),
                ),
                Row(
                  children: [
                    Container(
                        width: 88.w,
                        height: 21.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: appColors.borderColor,
                              width: 0.5
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                          color: appColors.white,
                        ),
                        child: TextFormField(
                            controller: controller.FareChargesController,
                            keyboardType: TextInputType.number,
                            onChanged: (newValue) {
                              if(controller.FareChargesController.text.isEmpty){
                                controller.FareError.value = false;
                                controller.AddCharges();
                              }
                              else{
                                if (int.parse(
                                    controller.FareChargesController.text) >
                                    1000) {
                                  controller.FareError.value = true;
                                  controller.AddCharges();
                                } else {
                                  controller.FareError.value = false;
                                  controller.AddCharges();
                                }
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.inter(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ))),
                    SizedBox(
                      width: 18.w,
                    ),
                    InkWell(
                      onTap: (controller.FareError.isFalse) ? null : () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: appColors.white.withOpacity(0.85),
                          builder: (BuildContext context) {
                            return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                content: Container(
                                  width: 372.w,
                                  height: 331.h,
                                  color: appColors.grey,
                                  child: Column(
                                      children: [
                                        SizedBox(
                                            height: 18.h
                                        ),
                                        Container(
                                            width: 372.w,
                                            height: 21.h,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    width: 90.w
                                                ),
                                                Text(
                                                  "Over Limit Expense Note",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: 66.w
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Ink(
                                                    width: 20.w,
                                                    height: 20.h,
                                                    child: Icon(
                                                      Icons.close,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                        SizedBox(
                                          height: 32.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 22.w,right: 24.w),
                                          child: Container(
                                            width: 328.w,
                                            height: 147.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.white,
                                            ),
                                            child: TextFormField(
                                                maxLines: null,
                                                minLines: null,
                                                expands: true,
                                                controller: controller.FareNotesController,
                                                style: GoogleFonts.inter(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                )
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Container(
                                            width: 141.w,
                                            height: 52.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.gradientColor1,
                                            ),
                                            child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Get.snackbar('Success', 'Added Fare Notes');
                                                },
                                                child: Text(
                                                    "Submit",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: appColors.white,
                                                    )
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                )
                            );
                          },
                        );
                      },
                      splashColor: Colors.black.withOpacity(0.4),
                      splashFactory: InkRipple.splashFactory,
                      child: Image.asset(
                        appAssets.userNotes,
                        width: 20.w,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Staff Meeting JC & Hotels",
                  style: GoogleFonts.inter(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: (controller.StaffError.isTrue)
                          ? appColors.gradientColor1
                          : appColors.black),
                ),
                Row(
                  children: [
                    Container(
                        width: 88.w,
                        height: 21.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: appColors.borderColor,
                              width: 0.5
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                          color: appColors.white,
                        ),
                        child: TextFormField(
                            controller: controller.StaffChargesController,
                            keyboardType: TextInputType.number,
                            onChanged: (newValue) {
                              if(controller.StaffChargesController.text.isEmpty){
                                controller.StaffError.value = false;
                                controller.AddCharges();
                              }
                              else{
                                if (int.parse(
                                    controller.StaffChargesController.text) >
                                    1000) {
                                  controller.StaffError.value = true;
                                  controller.AddCharges();
                                } else {
                                  controller.StaffError.value = false;
                                  controller.AddCharges();
                                }
                              }
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.inter(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ))),
                    SizedBox(
                      width: 18.w,
                    ),
                    InkWell(
                      onTap: (controller.StaffError.isFalse) ? null : () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: appColors.white.withOpacity(0.85),
                          builder: (BuildContext context) {
                            return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                content: Container(
                                  width: 372.w,
                                  height: 331.h,
                                  color: appColors.grey,
                                  child: Column(
                                      children: [
                                        SizedBox(
                                            height: 18.h
                                        ),
                                        Container(
                                            width: 372.w,
                                            height: 21.h,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    width: 90.w
                                                ),
                                                Text(
                                                  "Over Limit Expense Note",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: 66.w
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Ink(
                                                    width: 20.w,
                                                    height: 20.h,
                                                    child: Icon(
                                                      Icons.close,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                        SizedBox(
                                          height: 32.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 22.w,right: 24.w),
                                          child: Container(
                                            width: 328.w,
                                            height: 147.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.white,
                                            ),
                                            child: TextFormField(
                                                maxLines: null,
                                                minLines: null,
                                                expands: true,
                                                controller: controller.StaffNotesController,
                                                style: GoogleFonts.inter(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                )
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Container(
                                            width: 141.w,
                                            height: 52.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.gradientColor1,
                                            ),
                                            child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Get.snackbar('Success', 'Added Staff Notes');
                                                },
                                                child: Text(
                                                    "Submit",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: appColors.white,
                                                    )
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                )
                            );
                          },
                        );
                      },
                      splashColor: Colors.black.withOpacity(0.4),
                      splashFactory: InkRipple.splashFactory,
                      child: Image.asset(
                        appAssets.userNotes,
                        width: 20.w,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Phone",
                  style: GoogleFonts.inter(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: (controller.PhoneError.isTrue)
                          ? appColors.gradientColor1
                          : appColors.black),
                ),
                Row(
                  children: [
                    Container(
                        width: 88.w,
                        height: 21.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: appColors.borderColor,
                              width: 0.5
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                          color: appColors.white,
                        ),
                        child: TextFormField(
                            controller: controller.PhoneChargesController,
                            keyboardType: TextInputType.number,
                            onChanged: (newValue) {
                              if(controller.PhoneChargesController.text.isEmpty){
                                controller.PhoneError.value = false;
                                controller.AddCharges();
                              }
                              else{
                                if (int.parse(
                                    controller.PhoneChargesController.text) >
                                    1000) {
                                  controller.PhoneError.value = true;
                                  controller.AddCharges();
                                } else {
                                  controller.PhoneError.value = false;
                                  controller.AddCharges();
                                }
                              }
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.inter(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ))),
                    SizedBox(
                      width: 18.w,
                    ),
                    InkWell(
                      onTap: (controller.PhoneError.isFalse) ? null : () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: appColors.white.withOpacity(0.85),
                          builder: (BuildContext context) {
                            return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                content: Container(
                                  width: 372.w,
                                  height: 331.h,
                                  color: appColors.grey,
                                  child: Column(
                                      children: [
                                        SizedBox(
                                            height: 18.h
                                        ),
                                        Container(
                                            width: 372.w,
                                            height: 21.h,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    width: 90.w
                                                ),
                                                Text(
                                                  "Over Limit Expense Note",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: 66.w
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Ink(
                                                    width: 20.w,
                                                    height: 20.h,
                                                    child: Icon(
                                                      Icons.close,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                        SizedBox(
                                          height: 32.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 22.w,right: 24.w),
                                          child: Container(
                                            width: 328.w,
                                            height: 147.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.white,
                                            ),
                                            child: TextFormField(
                                                maxLines: null,
                                                minLines: null,
                                                expands: true,
                                                controller: controller.PhoneNotesController,
                                                style: GoogleFonts.inter(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                )
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Container(
                                            width: 141.w,
                                            height: 52.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.gradientColor1,
                                            ),
                                            child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Get.snackbar('Success', 'Added Phone Notes');
                                                },
                                                child: Text(
                                                    "Submit",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: appColors.white,
                                                    )
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                )
                            );
                          },
                        );
                      },
                      splashColor: Colors.black.withOpacity(0.4),
                      splashFactory: InkRipple.splashFactory,
                      child: Image.asset(
                        appAssets.userNotes,
                        width: 20.w,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Internet",
                  style: GoogleFonts.inter(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: (controller.InternetError.isTrue)
                          ? appColors.gradientColor1
                          : appColors.black),
                ),
                Row(
                  children: [
                    Container(
                        width: 88.w,
                        height: 21.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: appColors.borderColor,
                              width: 0.5
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                          color: appColors.white,
                        ),
                        child: TextFormField(
                            controller: controller.InternetChargesController,
                            keyboardType: TextInputType.number,
                            onChanged: (newValue) {
                              if(controller.InternetChargesController.text.isEmpty){
                                controller.InternetError.value = false;
                                controller.AddCharges();
                              }
                              else{
                                if (int.parse(controller
                                    .InternetChargesController.text) >
                                    1000) {
                                  controller.InternetError.value = true;
                                  controller.AddCharges();
                                } else {
                                  controller.InternetError.value = false;
                                  controller.AddCharges();
                                }
                              }
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.inter(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ))),
                    SizedBox(
                      width: 18.w,
                    ),
                    InkWell(
                      onTap: (controller.InternetError.isFalse) ? null : () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: appColors.white.withOpacity(0.85),
                          builder: (BuildContext context) {
                            return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                content: Container(
                                  width: 372.w,
                                  height: 331.h,
                                  color: appColors.grey,
                                  child: Column(
                                      children: [
                                        SizedBox(
                                            height: 18.h
                                        ),
                                        Container(
                                            width: 372.w,
                                            height: 21.h,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    width: 90.w
                                                ),
                                                Text(
                                                  "Over Limit Expense Note",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: 66.w
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Ink(
                                                    width: 20.w,
                                                    height: 20.h,
                                                    child: Icon(
                                                      Icons.close,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                        SizedBox(
                                          height: 32.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 22.w,right: 24.w),
                                          child: Container(
                                            width: 328.w,
                                            height: 147.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.white,
                                            ),
                                            child: TextFormField(
                                                maxLines: null,
                                                minLines: null,
                                                expands: true,
                                                controller: controller.InternetNotesController,
                                                style: GoogleFonts.inter(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                )
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Container(
                                            width: 141.w,
                                            height: 52.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.gradientColor1,
                                            ),
                                            child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Get.snackbar('Success', 'Added Internet Notes');
                                                },
                                                child: Text(
                                                    "Submit",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: appColors.white,
                                                    )
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                )
                            );
                          },
                        );
                      },
                      splashColor: Colors.black.withOpacity(0.4),
                      splashFactory: InkRipple.splashFactory,
                      child: Image.asset(
                        appAssets.userNotes,
                        width: 20.w,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Courier",
                  style: GoogleFonts.inter(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: (controller.CourierError.isTrue)
                          ? appColors.gradientColor1
                          : appColors.black),
                ),
                Row(
                  children: [
                    Container(
                        width: 88.w,
                        height: 21.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: appColors.borderColor,
                              width: 0.5
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                          color: appColors.white,
                        ),
                        child: TextFormField(
                            controller: controller.CourierChargesController,
                            keyboardType: TextInputType.number,
                            onChanged: (newValue) {
                              if(controller.CourierChargesController.text.isEmpty){
                                controller.CourierError.value = false;
                                controller.AddCharges();
                              }
                              else{
                                if (int.parse(controller
                                    .CourierChargesController.text) >
                                    1000) {
                                  controller.CourierError.value = true;
                                  controller.AddCharges();
                                } else {
                                  controller.CourierError.value = false;
                                  controller.AddCharges();
                                }
                              }
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.inter(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ))),
                    SizedBox(
                      width: 18.w,
                    ),
                    InkWell(
                      onTap: (controller.CourierError.isFalse) ? null : () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: appColors.white.withOpacity(0.85),
                          builder: (BuildContext context) {
                            return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                content: Container(
                                  width: 372.w,
                                  height: 331.h,
                                  color: appColors.grey,
                                  child: Column(
                                      children: [
                                        SizedBox(
                                            height: 18.h
                                        ),
                                        Container(
                                            width: 372.w,
                                            height: 21.h,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    width: 90.w
                                                ),
                                                Text(
                                                  "Over Limit Expense Note",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: 66.w
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Ink(
                                                    width: 20.w,
                                                    height: 20.h,
                                                    child: Icon(
                                                      Icons.close,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                        SizedBox(
                                          height: 32.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 22.w,right: 24.w),
                                          child: Container(
                                            width: 328.w,
                                            height: 147.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.white,
                                            ),
                                            child: TextFormField(
                                                maxLines: null,
                                                minLines: null,
                                                expands: true,
                                                controller: controller.CourierNotesController,
                                                style: GoogleFonts.inter(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                )
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Container(
                                            width: 141.w,
                                            height: 52.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.gradientColor1,
                                            ),
                                            child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Get.snackbar('Success', 'Added Courier Notes');
                                                },
                                                child: Text(
                                                    "Submit",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: appColors.white,
                                                    )
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                )
                            );
                          },
                        );
                      },
                      splashColor: Colors.black.withOpacity(0.4),
                      splashFactory: InkRipple.splashFactory,
                      child: Image.asset(
                        appAssets.userNotes,
                        width: 20.w,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Photostate/Stationary",
                  style: GoogleFonts.inter(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: (controller.PhotoStateError.isTrue)
                          ? appColors.gradientColor1
                          : appColors.black),
                ),
                Row(
                  children: [
                    Container(
                        width: 88.w,
                        height: 21.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: appColors.borderColor,
                              width: 0.5
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                          color: appColors.white,
                        ),
                        child: TextFormField(
                            controller: controller.PhotostateChargesController,
                            keyboardType: TextInputType.number,
                            onChanged: (newValue) {
                              if(controller.PhotostateChargesController.text.isEmpty){
                                controller.PhotoStateError.value = false;
                                controller.AddCharges();
                              }
                              else{
                                if (int.parse(controller
                                    .PhotostateChargesController.text) >
                                    1000) {
                                  controller.PhotoStateError.value = true;
                                  controller.AddCharges();
                                } else {
                                  controller.PhotoStateError.value = false;
                                  controller.AddCharges();
                                }
                              }
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.inter(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ))),
                    SizedBox(
                      width: 18.w,
                    ),
                    InkWell(
                      onTap: (controller.PhotoStateError.isFalse) ? null : () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: appColors.white.withOpacity(0.85),
                          builder: (BuildContext context) {
                            return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                content: Container(
                                  width: 372.w,
                                  height: 331.h,
                                  color: appColors.grey,
                                  child: Column(
                                      children: [
                                        SizedBox(
                                            height: 18.h
                                        ),
                                        Container(
                                            width: 372.w,
                                            height: 21.h,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    width: 90.w
                                                ),
                                                Text(
                                                  "Over Limit Expense Note",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: 66.w
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Ink(
                                                    width: 20.w,
                                                    height: 20.h,
                                                    child: Icon(
                                                      Icons.close,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                        SizedBox(
                                          height: 32.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 22.w,right: 24.w),
                                          child: Container(
                                            width: 328.w,
                                            height: 147.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.white,
                                            ),
                                            child: TextFormField(
                                                maxLines: null,
                                                minLines: null,
                                                expands: true,
                                                controller: controller.PhotostateNotesController,
                                                style: GoogleFonts.inter(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                )
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Container(
                                            width: 141.w,
                                            height: 52.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.gradientColor1,
                                            ),
                                            child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Get.snackbar('Success', 'Added Photostate Notes');
                                                },
                                                child: Text(
                                                    "Submit",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: appColors.white,
                                                    )
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                )
                            );
                          },
                        );
                      },
                      splashColor: Colors.black.withOpacity(0.4),
                      splashFactory: InkRipple.splashFactory,
                      child: Image.asset(
                        appAssets.userNotes,
                        width: 20.w,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sampling",
                  style: GoogleFonts.inter(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: (controller.PhotoStateError.isTrue)
                          ? appColors.gradientColor1
                          : appColors.black),
                ),
                Row(
                  children: [
                    Container(
                        width: 88.w,
                        height: 21.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: appColors.borderColor,
                              width: 0.5
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                          color: appColors.white,
                        ),
                        child: TextFormField(
                            controller: controller.SamplingChargesController,
                            keyboardType: TextInputType.number,
                            onChanged: (newValue) {
                              if(controller.SamplingChargesController.text.isEmpty){
                                controller.SamplingError.value = false;
                                controller.AddCharges();
                              }
                              else{
                                if (int.parse(controller
                                    .SamplingChargesController.text) >
                                    1000) {
                                  controller.SamplingError.value = true;
                                  controller.AddCharges();
                                } else {
                                  controller.SamplingError.value = false;
                                  controller.AddCharges();
                                }
                              }
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.inter(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ))),
                    SizedBox(
                      width: 18.w,
                    ),
                    InkWell(
                      onTap: (controller.SamplingError.isFalse) ? null : () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: appColors.white.withOpacity(0.85),
                          builder: (BuildContext context) {
                            return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                content: Container(
                                  width: 372.w,
                                  height: 331.h,
                                  color: appColors.grey,
                                  child: Column(
                                      children: [
                                        SizedBox(
                                            height: 18.h
                                        ),
                                        Container(
                                            width: 372.w,
                                            height: 21.h,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    width: 90.w
                                                ),
                                                Text(
                                                  "Over Limit Expense Note",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: 66.w
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Ink(
                                                    width: 20.w,
                                                    height: 20.h,
                                                    child: Icon(
                                                      Icons.close,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                        SizedBox(
                                          height: 32.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 22.w,right: 24.w),
                                          child: Container(
                                            width: 328.w,
                                            height: 147.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.white,
                                            ),
                                            child: TextFormField(
                                                maxLines: null,
                                                minLines: null,
                                                expands: true,
                                                controller: controller.SamplingNotesController,
                                                style: GoogleFonts.inter(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                )
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Container(
                                            width: 141.w,
                                            height: 52.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.gradientColor1,
                                            ),
                                            child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Get.snackbar('Success', 'Added Sampling Notes');
                                                },
                                                child: Text(
                                                    "Submit",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: appColors.white,
                                                    )
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                )
                            );
                          },
                        );
                      },
                      splashColor: Colors.black.withOpacity(0.4),
                      splashFactory: InkRipple.splashFactory,
                      child: Image.asset(
                        appAssets.userNotes,
                        width: 20.w,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Others",
                  style: GoogleFonts.inter(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: (controller.otherError.isTrue)
                          ? appColors.gradientColor1
                          : appColors.black),
                ),
                Row(
                  children: [
                    Container(
                        width: 88.w,
                        height: 21.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: appColors.borderColor,
                              width: 0.5
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                          color: appColors.white,
                        ),
                        child: TextFormField(
                            controller: controller.OtherChargesController,
                            keyboardType: TextInputType.number,
                            onChanged: (newValue) {
                              if(controller.OtherChargesController.text.isEmpty){
                                controller.otherError.value = false;
                                controller.AddCharges();
                              }
                              else{
                                if(int.parse(controller.OtherChargesController.text) > 1000){
                                  controller.otherError.value = true;
                                  controller.AddCharges();
                                }
                                else{
                                  controller.otherError.value = false;
                                  controller.AddCharges();
                                }
                              }
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.inter(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ))),
                    SizedBox(
                      width: 18.w,
                    ),
                    InkWell(
                      onTap: (controller.otherError.isFalse) ? null : () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: appColors.white.withOpacity(0.85),
                          builder: (BuildContext context) {
                            return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                content: Container(
                                  width: 372.w,
                                  height: 255.h,
                                  color: appColors.grey,
                                  child: Column(
                                      children: [
                                        SizedBox(
                                            height: 18.h
                                        ),
                                        Container(
                                            width: 372.w,
                                            height: 21.h,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    width: 118.w
                                                ),
                                                Text(
                                                  "Other Expenses",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: 98.w
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Ink(
                                                    width: 20.w,
                                                    height: 20.h,
                                                    child: Icon(
                                                      Icons.close,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                        SizedBox(
                                          height: 32.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 22.w,right: 24.w),
                                          child: Container(
                                            width: 328.w,
                                            height: 50.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.white,
                                            ),
                                            child: TextFormField(
                                                controller: controller.OtherNotesController,
                                                style: GoogleFonts.inter(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Type Here",
                                                  hintStyle: GoogleFonts.inter(
                                                    color: appColors.TextHint,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                  )
                                                )
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Container(
                                            width: 141.w,
                                            height: 52.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2.0),
                                              color: appColors.gradientColor1,
                                            ),
                                            child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Get.snackbar('Success', 'Added Other Items Notes');
                                                },
                                                child: Text(
                                                    "Submit",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: appColors.white,
                                                    )
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                )
                            );
                          },
                        );
                      },
                      splashColor: Colors.black.withOpacity(0.4),
                      splashFactory: InkRipple.splashFactory,
                      child: Image.asset(
                        appAssets.userNotes,
                        width: 20.w,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget getTotalCharges() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 80.w,
            child: Row(
              children: [
                SizedBox(
                  width: 23.w,
                  child: Text(
                    appConstants.simpleTotal,
                    style: GoogleFonts.inter(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: appColors.TextHint,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Obx(() => SizedBox(
                    width: 30.w,
                    child: Text(
                      controller.totalChargesAmount.value,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getUpdateButton(BuildContext context) {
    return Container(
      width: 292.w,
      height: 52.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: appColors.gradientColor1),
      child: TextButton(
          onPressed: () {
            if (controller.MaintenanceChargesController.text.isEmpty &&
                controller.FareChargesController.text.isEmpty &&
                controller.StaffChargesController.text.isEmpty &&
                controller.PhoneChargesController.text.isEmpty &&
                controller.SamplingChargesController.text.isEmpty &&
                controller.InternetChargesController.text.isEmpty &&
                controller.PhotostateChargesController.text.isEmpty &&
                controller.CourierChargesController.text.isEmpty &&
                controller.OtherChargesController.text.isEmpty) {
              Get.snackbar('Failure', 'Data is empty in all textfields',
                  backgroundColor: appColors.black, colorText: appColors.white);
            }
            else if (controller.MaintenanceChargesController.text.isEmpty ||
                controller.FareChargesController.text.isEmpty ||
                controller.StaffChargesController.text.isEmpty ||
                controller.PhoneChargesController.text.isEmpty ||
                controller.SamplingChargesController.text.isEmpty ||
                controller.InternetChargesController.text.isEmpty ||
                controller.PhotostateChargesController.text.isEmpty ||
                controller.CourierChargesController.text.isEmpty ||
                controller.OtherChargesController.text.isEmpty) {
              Get.snackbar('Failure', 'Data is empty on the empty textfields',
                  backgroundColor: appColors.black, colorText: appColors.white);
            }
            else {
              if (controller.maintenanceError.isFalse &&
                  controller.FareError.isFalse &&
                  controller.StaffError.isFalse &&
                  controller.PhoneError.isFalse &&
                  controller.InternetError.isFalse &&
                  controller.PhotoStateError.isFalse &&
                  controller.CourierError.isFalse &&
                  controller.SamplingError.isFalse &&
                  controller.otherError.isFalse) {
                Get.snackbar('Success', 'Data Entered SuccessFully',
                    backgroundColor: appColors.black,
                    colorText: appColors.white);
                Get.off(() => TravelExpensesScreen(), binding: Appbindings());
              } else {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: appColors.white.withOpacity(0.85),
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        width: 372.w,
                        height: 292.h,
                        color: Colors.white,
                        child: Column(

                        ),
                      ),
                    );
                  },
                );
              }
            }
          },
          child: Text(
            "Update",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: appColors.white,
            ),
          )),
    );
  }
}
