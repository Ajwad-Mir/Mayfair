import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayfair/res/export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({Key? key, required this.scaffoldKey}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Image.asset(
        appAssets.mayfairColored,
        width: 94.w,
        height: 40.h,
      ),
      backgroundColor: appColors.appBarColor,
      leading: IconButton(
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
        icon: Icon(Icons.menu,color: appColors.black),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none_rounded,color: appColors.black,size: 18,))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, kToolbarHeight);


}