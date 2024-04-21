import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/Theme/colors.dart';

class Custom_Card_Prodect extends StatelessWidget {
  const Custom_Card_Prodect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 10.h),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: secondarycolor, borderRadius: BorderRadius.circular(15)),
            width: MediaQuery.of(context).size.width,
            height: 220.h,
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 150.w,
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('assets/images/images (1).jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'نقطه  200',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'الاسم',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.delete_sharp,
              color: primarycolor,
              size: 28.sp,
            ),
          )
        ],
      ),
    );
  }
}
