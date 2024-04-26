import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/Theme/colors.dart';

class Custom_button extends StatelessWidget {
  String? text;
  Custom_button({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: 500.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.black, width: 2),
          color: primarycolor,
          boxShadow: [
            BoxShadow(
              color: primarycolor.withOpacity(.1),
              spreadRadius: 10.r,
              blurRadius: 15.r,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.only(
          left: 8.w,
        ),
        child: Row(
          children: [
            Icon(
              Icons.add_box,
              size: 24.sp,
            ),
            SizedBox(
              width: 30.w,
            ),
            Text(
              text!,
              style: TextStyle(
                  fontFamily: 'Cairo-Regular',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  height: 0.9),
            ),
          ],
        ),
      ),
    );
  }
}
