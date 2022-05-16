import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mayfair/export.dart';
import 'package:table_calendar/table_calendar.dart';

class AddTravelExpensesScreen extends GetView<AddTravelExpensesController>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TravelExpensesController>(
      builder: (_) => WillPopScope(
        onWillPop: () async{
          Get.clearRouteTree();
          Get.off(() => Homepage(),binding: Appbindings());
          return Future.value(true);
        },
        child: Scaffold(
          backgroundColor: appColors.white,
          key: _scaffoldKey,
          appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
          drawer: const CustomDrawer(),
          drawerScrimColor: appColors.transparent,
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                      height: 42.h
                  ),
                  getHeadQuartersTownExpensesHeading(),
                  SizedBox(
                    height: 14.h,
                  ),
                  getAutofillThisMonthButton(),
                  SizedBox(
                    height: 14.h,
                  ),
                  getCalendar(context),
                  SizedBox(
                    height: 5.3.h,
                  ),
                  getTotalAmountFromCalendar(context),
                  SizedBox(
                    height: 23.h,
                  ),
                  getTotalAmountList(),
                ],
              ),
            ),
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
          style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }

  Widget getAutofillThisMonthButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.0.w),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: 201.w,
          height: 36.h,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: appColors.white,
              backgroundColor: appColors.gradientColor1,
            ),
            child: Text(
              appConstants.autofillThisMonth,
              style: GoogleFonts.inter(
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: appColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getCalendar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      child: Obx(() => TableCalendar(
        headerStyle: HeaderStyle(
            headerPadding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 11.w),
            titleTextStyle: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
            formatButtonVisible: false,
            decoration: BoxDecoration(
                color: Colors.black
            ),
            rightChevronVisible: false,
            leftChevronVisible: false
        ),
        calendarBuilders: CalendarBuilders(
          selectedBuilder: (context, day, focusedDay) {
            final text = DateFormat.d().format(day);
            return Container(
              color: Color.fromRGBO(214, 155, 68, 1),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            );
          },
          outsideBuilder: (context,selectedDay,focusedDay){
            final text = DateFormat.d().format(selectedDay);
            return Container(
              color: Color.fromRGBO(230, 230, 230, 1),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ),
            );
          },
          defaultBuilder: (context,selectedDay,focusedDay){
            final text = DateFormat.d().format(selectedDay);
            return Container(
              color: Color.fromRGBO(242, 242, 242, 1),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ),
            );
          },
          disabledBuilder: (context,selectedDay,focusedDay){
            final text = DateFormat.d().format(selectedDay);
            return Container(
              color: Color.fromRGBO(230, 230, 230, 1),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ),
            );
          },
          todayBuilder: (context,selectedDay,focusedDay) {
            final text = DateFormat.d().format(selectedDay);
            return Container(
              color: Color.fromRGBO(242, 242, 242, 1),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(214, 155, 68, 0.5),
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            );
          },
          dowBuilder: (context, day) {
            final text = DateFormat.E().format(day);
            return Container(
              color: Color.fromRGBO(214, 155, 68, 1),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            );
          },
        ),
        firstDay: DateTime.utc(DateTime.now().year,DateTime.now().month,1),
        lastDay: DateTime.utc(DateTime.now().year,DateTime.now().month + 2,30),
        focusedDay: controller.focusedDay.value,
        selectedDayPredicate: (day) {
          return isSameDay(controller.selectedDay.value,day);
        },
        onDayLongPressed: (selectedDay,focusedDay) {
          controller.selectedDay.value = selectedDay;
          controller.focusedDay.value = focusedDay;
          Get.to(() => AddTravelExpensesWRTDate(), binding: Appbindings(),arguments: controller.selectedDay.value);
        },
        onPageChanged: (focusedDay) {
          controller.focusedDay.value = focusedDay;
        },
        calendarFormat: CalendarFormat.month,
        onDaySelected: (selectedDay,focusedDay){
          controller.selectedDay.value = selectedDay;
          controller.focusedDay.value = focusedDay;
        },
      ),
      ),
    );
  }

  Widget getTotalAmountFromCalendar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Total",
              style: GoogleFonts.inter(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: appColors.headingHint)),
          SizedBox(width: 17.w),
          Text("20,000",
              style: GoogleFonts.inter(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: appColors.black)),
        ],
      ),
    );
  }

  Widget getTotalAmountList() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        children: [
          Container(
            width: 374.w,
            padding: EdgeInsets.fromLTRB(13.w, 20.h, 7.w, 20.h),
            decoration: BoxDecoration(
              color: appColors.grey,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getDate(),
                SizedBox(
                  width: 22.w,
                ),
                getTravelledTo(),
                SizedBox(
                  width: 24.w,
                ),
                getExpenses(),
                SizedBox(
                  width: 26.w,
                ),
                getOptionsForOne(),
              ],
            ),
          ),
          SizedBox(
            height: 19.h,
          ),
          Container(
            width: 374.w,
            padding: EdgeInsets.fromLTRB(13.w, 20.h, 7.w, 20.h),
            decoration: BoxDecoration(
              color: appColors.grey,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getDate(),
                SizedBox(
                  width: 22.w,
                ),
                getTravelledTo(),
                SizedBox(
                  width: 24.w,
                ),
                getExpenses(),
                SizedBox(
                  width: 26.w,
                ),
                getOptionsForTwo(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date",
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: appColors.headingHint,
          )
        ),
        SizedBox(
          height: 19.h,
        ),
        Text(
          "26 January, 2022",
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          )
        ),
      ],
    );
  }

  Widget getTravelledTo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Travelled To",
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: appColors.headingHint,
            )
        ),
        SizedBox(
          height: 19.h,
        ),
        Text(
            "Gujranwala",
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            )
        ),
      ],
    );
  }

  Widget getExpenses() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Expense",
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: appColors.headingHint,
            )
        ),
        SizedBox(
          height: 19.h,
        ),
        Text(
            "1000",
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            )
        ),
      ],
    );
  }

  Widget getOptionsForOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 16.w,
              height: 16.h,
              child: Transform.scale(
                scale: 0.75,
                child: Obx(() => Checkbox(
                  value: controller.nightStayVal1.value,
                  onChanged: (bool? value) {
                    controller.nightStayVal1.value = value!;
                  },
                ),
                ),
              ),
            ),
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
          ],
        ),
        SizedBox(
          height: 19.h,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 15.w,
                height: 15.h,
                child: Image.asset(
                  appAssets.userNotes,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Container(
                width: 15.w,
                height: 15.h,
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.edit,
                  color: appColors.black,
                  size: 15,
                )
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget getOptionsForTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 16.w,
              height: 16.h,
              child: Transform.scale(
                scale: 0.75,
                child: Obx(() => Checkbox(
                    value: controller.nightStayVal2.value,
                    onChanged: (bool? value) {
                      controller.nightStayVal2.value = value!;
                    },
                  ),
                ),
              ),
            ),
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
          ],
        ),
        SizedBox(
          height: 19.h,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 15.w,
                height: 15.h,
                child: Image.asset(
                  appAssets.userNotes,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              GestureDetector(
                onTap: () {
                },
                child: Container(
                    width: 15.w,
                    height: 15.h,
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.edit,
                      color: appColors.black,
                      size: 15,
                    )
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

}