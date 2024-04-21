import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/Theme/colors.dart';

class Add_prodect extends StatelessWidget {
  const Add_prodect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: primarycolor,
        ),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text(
          'اضافه منتجات',
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
