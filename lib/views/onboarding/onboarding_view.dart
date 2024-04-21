import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/Theme/colors.dart';
import 'package:project/views/onboarding/intro_view.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          reverse: true,
          controller: _controller,
          children: [
            Intro(
              image: 'assets/images/intro1.png',
              title: 'حول المخلفات الي فوائد',
              subtitle: 'سوف تربح نقاط فوريه مع كل عمليه اعاده تدوير للقمامه ',
              ontap: () {
                _controller.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
            ),
            Intro(
              image: 'assets/images/intro2.png',
              title: 'جمع المخلفات بسهوله',
              subtitle:
                  'يمكنك بسهوله تحديد مواعيد جمع القمامه بحسب جدولك الشخصي ',
              ontap: () {
                Navigator.pushNamed(context, 'Home_View');
              },
            ),
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.60),
          child: SmoothPageIndicator(
              controller: _controller,
              count: 2,
              textDirection: TextDirection.rtl,
              effect: ExpandingDotsEffect(
                activeDotColor: primarycolor,
                dotHeight: 10.h,
                dotWidth: 10.w,
                dotColor: secondarycolor,
              )),
        ),
      ],
    ));
  }
}
