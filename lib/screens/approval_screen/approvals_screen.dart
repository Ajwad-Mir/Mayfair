import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mayfair/export.dart';

class ApprovalScreen extends GetView<ApprovalsController>{

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldTabBarKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.off(() => Homepage(),binding: Appbindings());
        return Future.value(true);
      },
      child: GetBuilder<ApprovalsController>(
        builder: (_) => DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: appColors.white,
            key: _scaffoldKey,
            appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
            drawer: CustomDrawer(),
            drawerScrimColor: appColors.transparent,
            body: Scaffold(
              key: _scaffoldTabBarKey,
              appBar: CustomApprovalsAppBar(scaffoldKey: _scaffoldTabBarKey),
              body: TabBarView(
                controller: controller.tabController,
                children: [
                  getApprovedOnes(context),
                  getRejectedOnes(context),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }

  Widget getApprovedOnes(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 47.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 27.w,right: 26.w),
            child: Row(
              children: [
                Container(
                  width: 175.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: appColors.white,
                      onPrimary: appColors.borderColor,
                    ),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.utc(2021,1,1),
                          lastDate: DateTime.utc(2023,3,1)
                      );
                    },
                    child: Container(
                      width: 135.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (controller.Selected_FromDate.toString().isEmpty) ? "From" : controller.Selected_FromDate.toString(),
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(
                            width: 80.w,
                          ),
                          Image.asset(
                            appAssets.calendar,
                            width: 19.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25.w,
                ),
                Container(
                  width: 175.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: appColors.white,
                      onPrimary: appColors.borderColor,
                    ),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.utc(2021,1,1),
                          lastDate: DateTime.utc(2023,3,1)
                      );
                    },
                    child: Container(
                      width: 144.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (controller.Selected_ToDate.toString().isEmpty) ? "To" : controller.Selected_ToDate.toString(),
                            style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(
                            width: 80.w,
                          ),
                          Image.asset(
                            appAssets.calendar,
                            width: 19.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 36.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Text(
              "16 Jan - 15 Feb",
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 9.h,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 25.w,right: 23.w),
              children: [
                Container(
                  width: 380.w,
                  color: appColors.white,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h,bottom: 16.5.h,left: 18.w,right: 20.5.w),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: appColors.transparent
                      ),
                      child: ExpansionTile(
                        childrenPadding: EdgeInsets.zero,
                        tilePadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: appColors.headingHint,
                                  )
                                ),
                                SizedBox(
                                  height: 18.5.h,
                                ),
                                Text(
                                    "16-01-22",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: appColors.black,
                                    )
                                )
                              ],
                            ),
                            SizedBox(
                              width: 47.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Grand Total",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: appColors.headingHint,
                                  )
                                ),
                                SizedBox(
                                  height: 18.5.h,
                                ),
                                Text(
                                  "21,000",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: appColors.black,
                                  )
                                )
                              ],
                            ),
                            SizedBox(
                              width: 35.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Over Limit",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: appColors.headingHint,
                                  )
                                ),
                                SizedBox(
                                  height: 18.5.h,
                                ),
                                Text(
                                  "2,000",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: appColors.black,
                                  )
                                )
                              ],
                            )
                          ],
                        ),
                        children: [
                          SizedBox(
                            height: 30.h
                          ),
                          Container(
                            width: 341.5,
                            decoration: BoxDecoration(
                              color: appColors.white,
                              border: Border.all(
                                color: Color.fromRGBO(53,204,6,1),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 21.h,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 19.w, right: 19.5.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "H.Q. Town Expenses",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: appColors.black
                                        )
                                      ),
                                      SizedBox(
                                        width: 53.w,
                                      ),
                                      Container(
                                        width: 96.w,
                                        height: 34.h,
                                        decoration: BoxDecoration(
                                          color: appColors.white,
                                          border: Border.all(
                                            color: const Color.fromRGBO(53,204,6,1),
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(4.0)
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "2000",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          )
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 13.5.h,
                                ),
                                Container(
                                  width: 341.5.w,
                                  decoration: BoxDecoration(
                                    border:Border.all(
                                      color: const Color.fromRGBO(53,204,6,1),
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 24.5.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 126.w,right: 33.5.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Manager Remarks",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: appColors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 36.w,
                                      ),
                                      Container(
                                        width: 15.w,
                                        height: 15.h,
                                        child: Image.asset(
                                          appAssets.userNotes
                                        ),
                                      )
                                    ],
                                  )
                                ),
                                SizedBox(
                                  height: 24.4.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: 8.6.h
                          ),
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Total",
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: appColors.headingHint,
                                  )
                                ),
                                SizedBox(
                                  width: 25.w
                                ),
                                Text(
                                    "20,000",
                                    style: GoogleFonts.inter(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: appColors.black,
                                    )
                                ),
                              ],
                            )
                          ),
                          SizedBox(
                              height: 30.h
                          ),
                          Container(
                            width: 341.5,
                            decoration: BoxDecoration(
                                color: appColors.white,
                                border: Border.all(
                                  color: Color.fromRGBO(53,204,6,1),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 21.h,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 19.w, right: 19.5.w),
                                  child: Row(
                                    children: [
                                      Text(
                                          "Travelling Expenses",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: appColors.black
                                          )
                                      ),
                                      SizedBox(
                                        width: 53.w,
                                      ),
                                      Container(
                                        width: 96.w,
                                        height: 34.h,
                                        decoration: BoxDecoration(
                                            color: appColors.white,
                                            border: Border.all(
                                              color: const Color.fromRGBO(53,204,6,1),
                                              width: 2.0,
                                            ),
                                            borderRadius: BorderRadius.circular(4.0)
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                            "2000",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 13.5.h,
                                ),
                                Container(
                                  width: 341.5.w,
                                  decoration: BoxDecoration(
                                    border:Border.all(
                                      color: const Color.fromRGBO(53,204,6,1),
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 24.5.h,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 126.w,right: 33.5.w),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Manager Remarks",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: appColors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 36.w,
                                        ),
                                        Container(
                                          width: 15.w,
                                          height: 15.h,
                                          child: Image.asset(
                                              appAssets.userNotes
                                          ),
                                        )
                                      ],
                                    )
                                ),
                                SizedBox(
                                  height: 24.4.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: 8.6.h
                          ),
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                    "Total",
                                    style: GoogleFonts.inter(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: appColors.headingHint,
                                    )
                                ),
                                SizedBox(
                                    width: 25.w
                                ),
                                Text(
                                    "20,000",
                                    style: GoogleFonts.inter(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: appColors.black,
                                    )
                                ),
                              ],
                            )
                          ),
                          SizedBox(
                            height: 24.h
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Overlimit Expense",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: appColors.black,
                                )
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: 341.5,
                            decoration: BoxDecoration(
                                color: appColors.white,
                                border: Border.all(
                                  color: Color.fromRGBO(53,204,6,1),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 21.h,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 19.w, right: 19.5.w),
                                  child: Row(
                                    children: [
                                      Text(
                                          "Laptop Maintenance",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: appColors.black
                                          )
                                      ),
                                      SizedBox(
                                        width: 53.w,
                                      ),
                                      Container(
                                        width: 96.w,
                                        height: 34.h,
                                        decoration: BoxDecoration(
                                            color: appColors.white,
                                            border: Border.all(
                                              color: const Color.fromRGBO(53,204,6,1),
                                              width: 2.0,
                                            ),
                                            borderRadius: BorderRadius.circular(4.0)
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                            "2000",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            )
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 13.5.h,
                                ),
                                Container(
                                  width: 341.5.w,
                                  decoration: BoxDecoration(
                                    border:Border.all(
                                      color: const Color.fromRGBO(53,204,6,1),
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 24.5.h,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 126.w,right: 33.5.w),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Manager Remarks",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: appColors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 36.w,
                                        ),
                                        Container(
                                          width: 15.w,
                                          height: 15.h,
                                          child: Image.asset(
                                              appAssets.userNotes
                                          ),
                                        )
                                      ],
                                    )
                                ),
                                SizedBox(
                                  height: 24.4.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: 8.6.h
                          ),
                          Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      "Total",
                                      style: GoogleFonts.inter(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: appColors.headingHint,
                                      )
                                  ),
                                  SizedBox(
                                      width: 25.w
                                  ),
                                  Text(
                                      "20,000",
                                      style: GoogleFonts.inter(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: appColors.black,
                                      )
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  )
                ),
                SizedBox(
                  height: 26.6.h,
                ),
                Container(
                    width: 380.w,
                    color: appColors.white,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.h,bottom: 16.5.h,left: 18.w,right: 20.5.w),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            dividerColor: appColors.transparent
                        ),
                        child: ExpansionTile(
                          childrenPadding: EdgeInsets.zero,
                          tilePadding: EdgeInsets.zero,
                          title: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Date",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: appColors.headingHint,
                                      )
                                  ),
                                  SizedBox(
                                    height: 18.5.h,
                                  ),
                                  Text(
                                      "17-01-22",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: appColors.black,
                                      )
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 47.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Grand Total",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: appColors.headingHint,
                                      )
                                  ),
                                  SizedBox(
                                    height: 18.5.h,
                                  ),
                                  Text(
                                      "21,000",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: appColors.black,
                                      )
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 35.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Over Limit",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: appColors.headingHint,
                                      )
                                  ),
                                  SizedBox(
                                    height: 18.5.h,
                                  ),
                                  Text(
                                      "2,000",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: appColors.black,
                                      )
                                  )
                                ],
                              )
                            ],
                          ),
                          children: [
                            SizedBox(
                                height: 30.h
                            ),
                            Container(
                              width: 341.5,
                              decoration: BoxDecoration(
                                  color: appColors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(53,204,6,1),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 21.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 19.w, right: 19.5.w),
                                    child: Row(
                                      children: [
                                        Text(
                                            "H.Q. Town Expenses",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                color: appColors.black
                                            )
                                        ),
                                        SizedBox(
                                          width: 53.w,
                                        ),
                                        Container(
                                          width: 96.w,
                                          height: 34.h,
                                          decoration: BoxDecoration(
                                              color: appColors.white,
                                              border: Border.all(
                                                color: const Color.fromRGBO(53,204,6,1),
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(4.0)
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                              "2000",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 13.5.h,
                                  ),
                                  Container(
                                    width: 341.5.w,
                                    decoration: BoxDecoration(
                                      border:Border.all(
                                        color: const Color.fromRGBO(53,204,6,1),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24.5.h,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 126.w,right: 33.5.w),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Manager Remarks",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: appColors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 36.w,
                                          ),
                                          Container(
                                            width: 15.w,
                                            height: 15.h,
                                            child: Image.asset(
                                                appAssets.userNotes
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                  SizedBox(
                                    height: 24.4.h,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 8.6.h
                            ),
                            Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        "Total",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: appColors.headingHint,
                                        )
                                    ),
                                    SizedBox(
                                        width: 25.w
                                    ),
                                    Text(
                                        "20,000",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: appColors.black,
                                        )
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(
                                height: 30.h
                            ),
                            Container(
                              width: 341.5,
                              decoration: BoxDecoration(
                                  color: appColors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(53,204,6,1),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 21.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 19.w, right: 19.5.w),
                                    child: Row(
                                      children: [
                                        Text(
                                            "Travelling Expenses",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                color: appColors.black
                                            )
                                        ),
                                        SizedBox(
                                          width: 53.w,
                                        ),
                                        Container(
                                          width: 96.w,
                                          height: 34.h,
                                          decoration: BoxDecoration(
                                              color: appColors.white,
                                              border: Border.all(
                                                color: const Color.fromRGBO(53,204,6,1),
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(4.0)
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                              "2000",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 13.5.h,
                                  ),
                                  Container(
                                    width: 341.5.w,
                                    decoration: BoxDecoration(
                                      border:Border.all(
                                        color: const Color.fromRGBO(53,204,6,1),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24.5.h,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 126.w,right: 33.5.w),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Manager Remarks",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: appColors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 36.w,
                                          ),
                                          Container(
                                            width: 15.w,
                                            height: 15.h,
                                            child: Image.asset(
                                                appAssets.userNotes
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                  SizedBox(
                                    height: 24.4.h,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 8.6.h
                            ),
                            Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        "Total",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: appColors.headingHint,
                                        )
                                    ),
                                    SizedBox(
                                        width: 25.w
                                    ),
                                    Text(
                                        "20,000",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: appColors.black,
                                        )
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(
                                height: 24.h
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    "Overlimit Expense",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: appColors.black,
                                    )
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: 341.5,
                              decoration: BoxDecoration(
                                  color: appColors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(53,204,6,1),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 21.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 19.w, right: 19.5.w),
                                    child: Row(
                                      children: [
                                        Text(
                                            "Laptop Maintenance",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                color: appColors.black
                                            )
                                        ),
                                        SizedBox(
                                          width: 53.w,
                                        ),
                                        Container(
                                          width: 96.w,
                                          height: 34.h,
                                          decoration: BoxDecoration(
                                              color: appColors.white,
                                              border: Border.all(
                                                color: const Color.fromRGBO(53,204,6,1),
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(4.0)
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                              "2000",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 13.5.h,
                                  ),
                                  Container(
                                    width: 341.5.w,
                                    decoration: BoxDecoration(
                                      border:Border.all(
                                        color: const Color.fromRGBO(53,204,6,1),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24.5.h,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 126.w,right: 33.5.w),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Manager Remarks",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: appColors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 36.w,
                                          ),
                                          Container(
                                            width: 15.w,
                                            height: 15.h,
                                            child: Image.asset(
                                                appAssets.userNotes
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                  SizedBox(
                                    height: 24.4.h,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 8.6.h
                            ),
                            Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        "Total",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: appColors.headingHint,
                                        )
                                    ),
                                    SizedBox(
                                        width: 25.w
                                    ),
                                    Text(
                                        "20,000",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: appColors.black,
                                        )
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getRejectedOnes(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 47.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 27.w,right: 26.w),
            child: Row(
              children: [
                Container(
                  width: 175.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: appColors.white,
                      onPrimary: appColors.borderColor,
                    ),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.utc(2021,1,1),
                          lastDate: DateTime.utc(2023,3,1)
                      );
                    },
                    child: Container(
                      width: 135.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (controller.Selected_FromDate.toString().isEmpty) ? "From" : controller.Selected_FromDate.toString(),
                            style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(
                            width: 80.w,
                          ),
                          Image.asset(
                            appAssets.calendar,
                            width: 19.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25.w,
                ),
                Container(
                  width: 175.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: appColors.white,
                      onPrimary: appColors.borderColor,
                    ),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.utc(2021,1,1),
                          lastDate: DateTime.utc(2023,3,1)
                      );
                    },
                    child: Container(
                      width: 144.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (controller.Selected_ToDate.toString().isEmpty) ? "To" : controller.Selected_ToDate.toString(),
                            style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(
                            width: 80.w,
                          ),
                          Image.asset(
                            appAssets.calendar,
                            width: 19.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 36.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Text(
              "16 Jan - 15 Feb",
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 9.h,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 25.w,right: 23.w),
              children: [
                Container(
                    width: 380.w,
                    color: appColors.white,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.h,bottom: 16.5.h,left: 18.w,right: 20.5.w),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            dividerColor: appColors.transparent
                        ),
                        child: ExpansionTile(
                          childrenPadding: EdgeInsets.zero,
                          tilePadding: EdgeInsets.zero,
                          title: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Date",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: appColors.headingHint,
                                      )
                                  ),
                                  SizedBox(
                                    height: 18.5.h,
                                  ),
                                  Text(
                                      "16-01-22",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: appColors.black,
                                      )
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 47.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Grand Total",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: appColors.headingHint,
                                      )
                                  ),
                                  SizedBox(
                                    height: 18.5.h,
                                  ),
                                  Text(
                                      "21,000",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: appColors.black,
                                      )
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 35.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Over Limit",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: appColors.headingHint,
                                      )
                                  ),
                                  SizedBox(
                                    height: 18.5.h,
                                  ),
                                  Text(
                                      "2,000",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: appColors.gradientColor1,
                                      )
                                  )
                                ],
                              )
                            ],
                          ),
                          children: [
                            SizedBox(
                                height: 26.5.h
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    "Overlimit Expense",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: appColors.black,
                                    )
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: 341.5,
                              decoration: BoxDecoration(
                                  color: appColors.white,
                                  border: Border.all(
                                    color: appColors.gradientColor1,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 21.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 19.w, right: 19.5.w),
                                    child: Row(
                                      children: [
                                        Text(
                                            "Laptop Maintenance",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                color: appColors.black
                                            )
                                        ),
                                        SizedBox(
                                          width: 53.w,
                                        ),
                                        Container(
                                          width: 96.w,
                                          height: 34.h,
                                          decoration: BoxDecoration(
                                              color: appColors.white,
                                              border: Border.all(
                                                color: appColors.gradientColor1,
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(4.0)
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "2000",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            )
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 13.5.h,
                                  ),
                                  Container(
                                    width: 341.5.w,
                                    decoration: BoxDecoration(
                                      border:Border.all(
                                        color: appColors.gradientColor1,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24.5.h,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 126.w,right: 33.5.w),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Manager Remarks",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: appColors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 36.w,
                                          ),
                                          Container(
                                            width: 15.w,
                                            height: 15.h,
                                            child: Image.asset(
                                                appAssets.userNotes
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                  SizedBox(
                                    height: 24.4.h,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 8.6.h
                            ),
                            Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        "Total",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: appColors.headingHint,
                                        )
                                    ),
                                    SizedBox(
                                        width: 25.w
                                    ),
                                    Text(
                                        "20,000",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: appColors.black,
                                        )
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    )
                ),
                SizedBox(
                  height: 26.6.h,
                ),
                Container(
                    width: 380.w,
                    color: appColors.white,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.h,bottom: 16.5.h,left: 18.w,right: 20.5.w),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: appColors.transparent
                        ),
                        child: ExpansionTile(
                          childrenPadding: EdgeInsets.zero,
                          tilePadding: EdgeInsets.zero,
                          title: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: appColors.headingHint,
                                    )
                                  ),
                                  SizedBox(
                                    height: 18.5.h,
                                  ),
                                  Text(
                                      "17-01-22",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: appColors.black,
                                      )
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 47.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Grand Total",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: appColors.headingHint,
                                      )
                                  ),
                                  SizedBox(
                                    height: 18.5.h,
                                  ),
                                  Text(
                                      "21,000",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: appColors.black,
                                      )
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 35.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Over Limit",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: appColors.headingHint,
                                      )
                                  ),
                                  SizedBox(
                                    height: 18.5.h,
                                  ),
                                  Text(
                                      "2,000",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: appColors.gradientColor1,
                                      )
                                  )
                                ],
                              )
                            ],
                          ),
                          children: [
                            SizedBox(
                                height: 26.5.h
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    "Overlimit Expense",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: appColors.black,
                                    )
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: 341.5,
                              decoration: BoxDecoration(
                                  color: appColors.white,
                                  border: Border.all(
                                    color: appColors.gradientColor1,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 21.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 19.w, right: 19.5.w),
                                    child: Row(
                                      children: [
                                        Text(
                                            "Laptop Maintenance",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                color: appColors.black
                                            )
                                        ),
                                        SizedBox(
                                          width: 53.w,
                                        ),
                                        Container(
                                          width: 96.w,
                                          height: 34.h,
                                          decoration: BoxDecoration(
                                              color: appColors.white,
                                              border: Border.all(
                                                color: appColors.gradientColor1,
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(4.0)
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                              "2000",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 13.5.h,
                                  ),
                                  Container(
                                    width: 341.5.w,
                                    decoration: BoxDecoration(
                                      border:Border.all(
                                        color: appColors.gradientColor1,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24.5.h,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 126.w,right: 33.5.w),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Manager Remarks",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: appColors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 36.w,
                                          ),
                                          Container(
                                            width: 15.w,
                                            height: 15.h,
                                            child: Image.asset(
                                                appAssets.userNotes
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                  SizedBox(
                                    height: 24.4.h,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 8.6.h
                            ),
                            Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        "Total",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: appColors.headingHint,
                                        )
                                    ),
                                    SizedBox(
                                        width: 25.w
                                    ),
                                    Text(
                                        "20,000",
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: appColors.black,
                                        )
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}