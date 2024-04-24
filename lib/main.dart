import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/firebase_options.dart';
import 'package:project/views/home/home.dart';
import 'package:project/views/onboarding/onboarding_view.dart';
import 'package:project/views/splah_screen.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Origami());
}

class Origami extends StatelessWidget {
  const Origami({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(360, 690),
      child: MaterialApp(
        theme: ThemeData(),
        home: SplashScreen(
          nextScreen: OnBoardingView(),
        ),
        routes: {'Home_View': (context) => Home_View()},
      ),
    );
  }
}
