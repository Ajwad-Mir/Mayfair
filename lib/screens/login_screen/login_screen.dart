import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mayfair/export.dart';

class LoginScreen extends GetView<LoginController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  appColors.gradientColor1,
                  appColors.gradientColor2,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 104.h,
                ),
                getLogo(),
                SizedBox(
                  height: 80.h,
                ),
                getLoginForm(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getLogo() {
    return Image.asset(
      appAssets.mayfairSimple,
      width: 160.w,
      height: 99.h,
    );
  }

  Widget getLoginForm(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 644.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60),
          topLeft: Radius.circular(60)
        )
      ),
      padding: EdgeInsets.all(68),
      child: Column(
        children: [
          getUserEmailFormField(),
          SizedBox(
            height: 25.h,
          ),
          getUserPasswordFormField(),
          SizedBox(
            height: 42.h,
          ),
          getLoginButton(),
        ],
      ),
    );
  }

  Widget getUserEmailFormField() {
    return SizedBox(
      width: 295.w,
      height: 80.h,
      child: Column(
        children: [
          SizedBox(
            width: 290.w,
            height: 19.h,
            child: Text(
              appConstants.userNameLabel,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 9.h),
          Container(
            width: 290.w,
            height: 52.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              border: Border.all(
                width: 0.5,
                color: appColors.borderColor
              )
            ),
            child: TextFormField(
              controller: controller.userEmail,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget getUserPasswordFormField() {
    return SizedBox(
      width: 295.w,
      height: 80.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 290.w,
            height: 19.h,
            child: Text(
              appConstants.userPasswordLabel,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 9.h),
          Container(
              width: 290.w,
              height: 52.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  border: Border.all(
                      style: BorderStyle.solid,
                      width: 0.5,
                      color: appColors.borderColor
                  )
              ),
              child: TextFormField(
                obscureText: true,
                controller: controller.userPassword,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget getLoginButton() {
    return SizedBox(
      width: 292.w,
      height: 52.h,
      child: TextButton(
        onPressed: () {
          Get.off(() => Homepage());
        },
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.red,
        ),
        child: Text(
          appConstants.login,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}