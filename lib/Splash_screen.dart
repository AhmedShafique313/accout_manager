// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'dart:async';

import 'package:accout_manager/Signup_screen.dart';
import 'package:accout_manager/colors.dart';
// ignore: unused_import
import 'package:accout_manager/home_screen.dart';
// ignore: unused_import
import 'package:accout_manager/login_screen.dart';
import 'package:accout_manager/sec_splash.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    process();
  }

  // Process what to do when user already logged in or Signed up
  void process() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    bool islogin = sp.getBool('islogin') ?? false;
    // ignore: non_constant_identifier_names

    if (islogin) {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoadingScreen()));
      });
    }
    // If user is not logged in or Signed up
    else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignupScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset('images/balls.png'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Accounting App',
                style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Pallete.gradient1),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                  child: LoadingAnimationWidget.inkDrop(
                      color: Pallete.gradient2, size: 100)),
            ],
          ),
        ],
      ),
    );
  }
}
