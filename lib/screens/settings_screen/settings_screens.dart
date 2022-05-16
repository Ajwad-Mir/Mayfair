import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mayfair/export.dart';

class SettingsScreen extends GetView<SettingsController>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.off(() => Homepage(),binding: Appbindings());
        return Future.value(true);
      },
      child: GetBuilder<SettingsController>(
        builder: (_) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
            drawer: CustomDrawer(),
            drawerScrimColor: appColors.transparent,
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: 35.h,
                  ),
                  getChangePasswordHeading(),
                  SizedBox(
                    height: 10.h,
                  ),
                  getChangePassword(),
                ],
              ),
            ),
          );
        }
      ),
    );
  }


  Widget getChangePassword() {
    return Container(
      width: 384.w,
      height: 311.h,
      child: Column(
        children: [
          Container(
            width: 384.w,
            height: 311.h,
            color: appColors.grey,
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  width: 355.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                      color: appColors.white,
                      border: Border.all(
                        color: appColors.borderColor,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(2.0)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                  child: TextFormField(
                    controller: controller.changepassController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter New Password"
                    ),
                  ),
                ),
                SizedBox(
                  height: 34.h,
                ),
                Container(
                  width: 355.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                      color: appColors.white,
                      border: Border.all(
                        color: appColors.borderColor,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(2.0)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                  child: TextFormField(
                    controller: controller.confirmChangePassController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Confirm New Password"
                    ),
                  ),
                ),
                SizedBox(
                  height: 33.h,
                ),
                Container(
                  width: 355.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    color: appColors.gradientColor1,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: appColors.white,
                    ),
                    child: Text(
                        "Update",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: appColors.white,
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getChangePasswordHeading() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 33.h),
      child: Container(
        width: double.infinity,
        child: Text(
          "Change Password",
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

}
