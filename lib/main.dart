import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:covid_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'screens/tracker.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            splashIconSize: 200,
            duration: 3000,
            splash: "assets/logo.png",
            nextScreen: Tracker(),
            splashTransition: SplashTransition.slideTransition,
            backgroundColor: kPrimaryColor));
  }
}
