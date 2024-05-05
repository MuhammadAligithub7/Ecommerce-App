import 'package:easyshop_app/Screens/Auth/SignInScreen.dart';
import 'package:easyshop_app/Utils/AppConstants.dart';
import 'package:easyshop_app/Widgets/MySnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppConstants.appMainColor,
            elevation: 0,
            centerTitle: true,
            title: const Text("Welcome To Easy Shopping"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                alignment: Alignment.center,
                color: AppConstants.appMainColor,
                child: Lottie.asset("assets/Cart.json"),
              ),

              SizedBox(height: Get.height/20),

              const Text("Happy Shopping", style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),

              SizedBox(height: Get.height/20),
              
              Material(
                child: Container(
                  width: Get.width/2,
                  height: Get.height/15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppConstants.appMainColor,
                  ),
                  child: TextButton.icon(onPressed: (){showSnackBar(title: "Sorry !", message: "Google Sign In is Not Working ");},
                      icon: Image.asset("assets/googleicon.png", width: Get.width/10, height: Get.height/20,),
                      label: const Text('Sign In with Google', style: TextStyle(color: AppConstants.appTextColor),)),
                ),
              ),

              SizedBox(height: Get.height/40),

              Material(
                child: Container(
                  width: Get.width/2,
                  height: Get.height/15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppConstants.appMainColor,
                  ),
                  child: TextButton.icon(onPressed: (){
                    Get.to(const SigninScreen());
                    },
                      icon: Image.asset("assets/emailicon.png", width: Get.width/10, height: Get.height/20,),
                      label: const Text('Sign In with Email', style: TextStyle(color: AppConstants.appTextColor),)),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
