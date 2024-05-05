import 'dart:async';
import 'package:easyshop_app/Screens/Auth/WelcomeScreen.dart';
import 'package:easyshop_app/Utils/AppConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(const WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.appSecondaryColor,
      appBar: AppBar(
        backgroundColor: AppConstants.appSecondaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [

          Expanded(
            child: Container(
              color: AppConstants.appSecondaryColor,
              width: Get.width,
              height: Get.height,
              child: Lottie.asset("assets/Cart.json"),
            ),
          ),

          const Divider(),

          Container(
            margin: const EdgeInsets.only(bottom: 30),
            alignment: Alignment.center,
            width: Get.width,
            child: Text(AppConstants.appCreatedBy,style: const TextStyle(color: AppConstants.appTextColor, fontSize: 14, fontWeight: FontWeight.bold),),
          ),
          
        ],
      ),
    );
  }
}
