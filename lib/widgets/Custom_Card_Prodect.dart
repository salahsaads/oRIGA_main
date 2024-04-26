import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/Theme/colors.dart';
import 'package:project/firbase_service/Service.dart';
import 'package:project/model/Card_prodect.dart';

class Custom_Card_Prodect extends StatelessWidget {
  Card_Prodect_Model card_prodect_model;
  Custom_Card_Prodect({
    required this.card_prodect_model,
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
                      image: NetworkImage('${card_prodect_model.image}'),
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
                        'نقطه  ${card_prodect_model.point}',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '${card_prodect_model.name}',
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
            child: GestureDetector(
              onTap: () {
                Service().delete_service1(card_prodect_model.name); 
              },
              child: Icon(
                Icons.delete_sharp,
                color: primarycolor,
                size: 28.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
