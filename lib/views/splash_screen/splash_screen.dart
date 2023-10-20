import 'dart:async';

import 'package:flutter/material.dart';
import 'package:session8/core/size_config.dart';
import 'package:session8/services/shared_prefrence_helper.dart';
import 'package:session8/views/Appointment%20Screen/view/appointments_screen.dart';
import 'package:session8/views/Authentication%20Screen/view/authentication_screen.dart';
import 'package:session8/views/Login%20Screen/view/login_screeen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => route());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Image.asset(
          "assets/images/money.png",
        ),
      ),
    );
  }

  dynamic route() {
    if (SharedPreferenceHelper.getData(key: "USER_TOKEN") == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthenticationScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AppointmentsScreen()),
      );
    }
  }
}
