import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project/Theme/colors.dart';
import 'package:project/firbase_service/Service.dart';

class Add_Point extends StatefulWidget {
  const Add_Point({super.key});

  @override
  State<Add_Point> createState() => _Add_PointState();
}

class _Add_PointState extends State<Add_Point> {
  bool ok = false;
  TextEditingController phone = TextEditingController();
  TextEditingController point = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Container(
      //   width: 50.w,
      //   height: 50.h,
      //   decoration: BoxDecoration(
      //     color: primarycolor,
      //   ),
      //   child: Icon(Icons.add),
      // ),
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text(
          'اضافه نقط',
          style: TextStyle(
              fontFamily: 'Cairo-Regular',
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              height: 0.9),
        ),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: ok,
        child: PageView(reverse: true, children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'رقم الهاتف',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'NotoKufiArabic',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // TextField(
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(15.r))),
                  // ),
                  TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    cursorColor: primarycolor,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        contentPadding: const EdgeInsets.all(13.0),
                        hintTextDirection: TextDirection.rtl,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ' : النقط',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'NotoKufiArabic',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // TextField(
                  //   keyboardType: TextInputType.number,
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(15.r))),
                  // )

                  TextFormField(
                    controller: point,
                    keyboardType: TextInputType.number,
                    cursorColor: primarycolor,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        contentPadding: const EdgeInsets.all(13.0),
                        hintTextDirection: TextDirection.rtl,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none)),
                  ),

                  SizedBox(
                    height: 30.h,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        bool result =
                            await InternetConnectionChecker().hasConnection;
                        if (result == true) {
                          setState(() {
                            ok = true;
                          });
                          String x = await Service().Add_point(
                              phone: phone.text, point: int.parse(point.text));
                          if (x == 'yes') {
                            setState(() {
                              ok = false;
                            });
                            phone.clear();
                            point.clear();
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.success,
                              body: Center(
                                child: Text(
                                  'تم اضافه النقط بنجاح ',
                                  style: TextStyle(
                                      color: primarycolor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Marhey'),
                                ),
                              ),
                            ).show();
                          }
                        } else {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.scale,
                            dialogType: DialogType.error,
                            body: Center(
                              child: Text(
                                'تاكد باتصالك بالانترنت',
                                style: TextStyle(
                                    color: primarycolor,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Marhey'),
                              ),
                            ),
                          ).show();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            primarycolor), // Change button color
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15.r), // Customize border radius
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          '  اضافه النقط',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white, // Text color
                            fontWeight: FontWeight.bold,
                            fontFamily:
                                'NotoKufiArabic', // Specify font family if needed
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
