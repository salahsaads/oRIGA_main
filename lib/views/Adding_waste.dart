import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project/Theme/colors.dart';
import 'package:path/path.dart';
import 'package:project/firbase_service/Service.dart';
import 'package:project/views/home/home.dart';

class Add_waste extends StatefulWidget {
  Add_waste({super.key});

  @override
  State<Add_waste> createState() => _Add_wasteState();
}

class _Add_wasteState extends State<Add_waste> {
  File? file2;

  bool getimage = false;

  String? url2;

  TextEditingController name = TextEditingController();

  TextEditingController point = TextEditingController();

  XFile? image;

  bool ok = false;

  UploadImage_camera3() async {
    ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        file2 = File(image!.path);
        getimage = true;
      });
    }
  }

  Future<void> add_image() async {
    var metadata = SettableMetadata(
      contentType: "image/jpeg",
    );
    var imgname = basename(image!.path);
    var ref = FirebaseStorage.instance.ref("$imgname");
    await ref.putFile(file2!, metadata);

    url2 = await ref.getDownloadURL();
  }

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
                  getimage == true
                      ? Container(
                          width: 200.w,
                          height: 200.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  file2!,
                                ),
                              )),
                        )
                      : Container(
                          width: 200.w,
                          height: 200.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/images (1).png'))),
                        ),
                  SizedBox(
                    height: 30.h,
                  ),

                  ElevatedButton(
                      onPressed: () {
                        UploadImage_camera3();
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
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          'اضافه صوره',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white, // Text color
                            fontWeight: FontWeight.bold,
                            fontFamily:
                                'NotoKufiArabic', // Specify font family if needed
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ' :الاسم ',
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
                    controller: name,
                    cursorColor: primarycolor,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        contentPadding: const EdgeInsets.all(13.0),
                        hintTextDirection: TextDirection.rtl,
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ' :  النقط للكيلوا الواحد',
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
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none)),
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
                          await add_image();

                          await Service().addUser_waste(
                              name: name.text,
                              point: int.parse(point.text),
                              image: url2!);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home_View()));
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
                          'اضافه',
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
