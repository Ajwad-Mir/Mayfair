import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:mayfair/export.dart';

class TravelExpensesScreen extends GetView<TravelExpensesController>{
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
                      height: 4.h
                  ),
                  getGrandTotalContainer(),
                  SizedBox(
                      height: 28.h
                  ),
                  getAddTravelingExpensesLink(),
                  SizedBox(
                    height: 32.h,
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
                  getTotalAmountFromCalendar(context)
                ],
              ),
            ),
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
          border: Border.all(
              width: 1.0,
              color: Color.fromRGBO(112, 112, 112, 1)
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              "40,000",
              style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: appColors.white
              )
          ),
          SizedBox(
              height: 10.h
          ),
          Text(
              "Grand Total",
              style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: appColors.white
              )
          ),
        ],
      ),
    );
  }

  Widget getAddTravelingExpensesLink() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          print("Add Travelling Expenses Button Clicked");
          Get.offAll(() => AddTravelExpensesScreen(), binding: Appbindings());
        },
        child: Text(
          appConstants.addTravelExpenses,
          style: GoogleFonts.inter(
            decoration: TextDecoration.underline,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: appColors.gradientColor1,
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
            Get.to(() => ExpensesPerDayScreen(), binding: Appbindings(),arguments: controller.selectedDay.value);
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

}
