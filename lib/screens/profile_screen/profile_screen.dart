import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mayfair/export.dart';

class ProfileScreen extends GetView<ProfileController>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.off(() => Homepage(),binding: Appbindings());
        return Future.value(true);
      },
      child: GetBuilder<ProfileController>(
        builder: (_) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
            drawer: CustomDrawer(),
            drawerScrimColor: appColors.transparent,
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 325.h,
                        color: appColors.black,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 62.h,
                            ),
                            Center(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 130.w,
                                    height: 130.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(appAssets.profilePic),
                                        )
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                        width: 40.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: appColors.white,
                                        ),
                                        child: InkWell(
                                          child: Icon(
                                            Icons.edit,
                                            color: appColors.black,
                                          ),
                                          onTap: () {
                                            print("Pressed");
                                          },
                                          splashColor: appColors.black,
                                        )
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                "Naeem Khan",
                                style: GoogleFonts.inter(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                    color: appColors.white
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                "Member since 01-01-21",
                                style: GoogleFonts.inter(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                    color: appColors.white
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 300.h,
                    left: 22.w,
                    right: 22.w,
                    child: Container(
                      height: 362.h,
                      decoration: BoxDecoration(
                        color: appColors.white,
                        borderRadius: BorderRadius.circular(2.0),
                        border: Border.all(
                          width: 0.2,
                          color: appColors.borderColor
                        )
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 36.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 62.h,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 105.w,
                                child: Text(
                                  "Designation",
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  )
                                ),
                              ),
                              SizedBox(
                                width: 47.h,
                              ),
                              Text(
                                "RSM",
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                )
                              )
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: appColors.dividerColor,
                          ),
                          SizedBox(
                            height: 42.5.h,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 105.w,
                                child: Text(
                                  "Contact Number",
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  )
                                ),
                              ),
                              SizedBox(
                                width: 47.h,
                              ),
                              Text(
                                "12345678",
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                )
                              )
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: appColors.dividerColor,
                          ),

                          SizedBox(
                            height: 42.5.h,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 105.w,
                                child: Text(
                                  "City",
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  )
                                ),
                              ),
                              SizedBox(
                                width: 47.h,
                              ),
                              Text(
                                "Lahore",
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                )
                              )
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: appColors.dividerColor,
                          ),

                          SizedBox(
                            height: 42.5.h,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 105.w,
                                child: Text(
                                  "Address",
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  )
                                ),
                              ),
                              SizedBox(
                                width: 47.h,
                              ),
                              Text(
                                "Lorem Ipsum......",
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                )
                              )
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: appColors.dividerColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}