import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project/Theme/colors.dart';
import 'package:project/views/Add%20_a_product.dart';
import 'package:project/views/Adding_waste.dart';
import 'package:project/widgets/Custom_Card_Prodect.dart';
import 'package:project/widgets/Custom_Card_Waste.dart';

import 'package:project/widgets/custom_button.dart';

class Home_View extends StatefulWidget {
  const Home_View({super.key});

  @override
  State<Home_View> createState() => _Home_ViewState();
}

class _Home_ViewState extends State<Home_View>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: secondarycolor,
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 150.h),
          child: Column(
            children: [
              Animate(
                effects: [FadeEffect(), ScaleEffect()],
                child: Container(
                    width: 100.w,
                    height: 100.h,
                    child: Image.asset('assets/images/logo.png')),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Add_prodect()));
                  },
                  child: Custom_button(text: 'اضافه منتجات')),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Add_waste()));
                  },
                  child: Custom_button(text: 'اضافه  مخلفات'))
            ],
          ),
        ),
      ),
      backgroundColor: secondarycolor,
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                size: 30.sp,
                color: secondarycolor,
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: primarycolor,
        title: Animate(
          effects: [FadeEffect(), ScaleEffect()],
          child: Container(
              padding: EdgeInsets.only(top: 15.h),
              width: 50.w,
              child: Image.asset('assets/images/logo.png')),
        ),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: secondarycolor,
          indicatorWeight: 5,
          controller: _tabController,
          tabs: [
            Tab(
              //  text: 'المنتجات',
              child: Text(
                'المنتجات',
                style: TextStyle(
                    fontFamily: 'Cairo-Regular',
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 0.9),
              ),
            ),
            Tab(
              child: Text(
                'المخلفات',
                style: TextStyle(
                    fontFamily: 'Cairo-Regular',
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 0.9),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Contents of Tab 1
          Body_Home1(),

          // Contents of Tab 2
          Body_Home2()
        ],
      ),
    );
  }
}

class Body_Home1 extends StatelessWidget {
  const Body_Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Custom_Card_Prodect(),
    );
  }
}

class Body_Home2 extends StatelessWidget {
  const Body_Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Custom_Card_Waste(),
    );
  }
}
