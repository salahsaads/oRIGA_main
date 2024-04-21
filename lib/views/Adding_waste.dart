import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/Theme/colors.dart';

class Add_waste extends StatelessWidget {
  const Add_waste({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text(
          'اضافه مخلفات',
          style: TextStyle(
              fontFamily: 'Cairo-Regular',
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              height: 0.9),
        ),
        centerTitle: true,
      ),
    );
  }
}
