import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mayfair/export.dart';

class Homepage extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        backgroundColor: appColors.white,
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
        ),
        drawer: CustomDrawer(),
        drawerScrimColor: appColors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h),
              getGrandTotalContainer(),
              SizedBox(height: 30.h),
              getProfileContainer(),
              SizedBox(
                height: 40.h,
              ),
              getHeadQuartersTownExpensesHeading(),
              SizedBox(
                height: 22.h,
              ),
              getHeadQuartersTownExpensesData(context),
              SizedBox(
                height: 40.h,
              ),
              getTravelExpensesHeading(),
              SizedBox(
                height: 22.h,
              ),
              getTravelExpensesData(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget getGrandTotalContainer() {
    return Container(
      width: double.infinity,
      height: 131.w,
      decoration: BoxDecoration(
          color: Colors.black,
          border:
              Border.all(width: 1.0, color: Color.fromRGBO(112, 112, 112, 1))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("40,000",
              style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: appColors.white)),
          SizedBox(height: 10.h),
          Text("Grand Total",
              style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: appColors.white)),
        ],
      ),
    );
  }

  Widget getProfileContainer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31.w),
      child: Row(
        children: [
          Container(
            width: 72.0.w,
            height: 72.0.h,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(
              appAssets.profilePic,
            ),
          ),
          SizedBox(
            width: 19.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              Text(
                "Naeem Khan",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getHeadQuartersTownExpensesHeading() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31.w),
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

  Widget getHeadQuartersTownExpensesData(BuildContext context) {
    return Container(
      height: 127.h,
      color: appColors.grey,
      padding: EdgeInsets.symmetric(horizontal: 33.0.w, vertical: 32.0.h),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Month",
                  style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: appColors.headingHint)),
              SizedBox(height: 17.h),
              Text("16 Jan - 15 Feb",
                  style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: appColors.black)),
            ],
          ),
          SizedBox(width: 28.w),
          GestureDetector(
            onTap: () {
              print("Pressed");
              Get.to(() => TravelExpensesScreen(), binding: Appbindings());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  appAssets.dropdown,
                  width: 20.w,
                  color: Colors.black,
                )
              ],
            ),
          ),
          SizedBox(width: 95.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: appColors.headingHint)),
                SizedBox(height: 17.h),
                Text("20,000",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: appColors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getTravelExpensesHeading() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31.w),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          appConstants.travelHeading,
          style:
              GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget getTravelExpensesData(BuildContext context) {
    return Container(
      height: 127.h,
      color: appColors.grey,
      padding: EdgeInsets.symmetric(horizontal: 33.0.w, vertical: 32.0.h),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Month",
                  style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: appColors.headingHint)),
              SizedBox(height: 17.h),
              Text("16 Jan - 15 Feb",
                  style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: appColors.black)),
            ],
          ),
          SizedBox(width: 28.w),
          GestureDetector(
            onTap: () {
              print("Pressed");
              Get.to(() => TravelExpensesScreen(), binding: Appbindings());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  appAssets.dropdown,
                  width: 20.w,
                  color: Colors.black,
                )
              ],
            ),
          ),
          SizedBox(width: 95.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: appColors.headingHint)),
                SizedBox(height: 17.h),
                Text("20,000",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: appColors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
