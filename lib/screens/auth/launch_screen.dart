import 'dart:async';

import 'package:fierbase_auth/firebase/fb_auth/fb_auth.dart';
import 'package:fierbase_auth/screens/auth/login_screen.dart';
import 'package:fierbase_auth/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),()async{
      FirebaseAuth.instance
          .authStateChanges()
          .listen((User? user) {
        if (user == null) {
          Get.off(LoginScreen());
        } else {
          Get.off(HomeScreen());
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [
                  Colors.cyanAccent,
                  Colors.blue,
                  Colors.black87,
                ],
              ),
            ),
          ),
          Center(
            child: Text(
              'Firebase Authentication',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
