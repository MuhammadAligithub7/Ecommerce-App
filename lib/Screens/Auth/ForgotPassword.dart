import 'package:easyshop_app/Controllers/ForgotPassword.dart';
import 'package:easyshop_app/Utils/AppConstants.dart';
import 'package:easyshop_app/Widgets/MySnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());
  TextEditingController userEmailController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        backgroundColor: AppConstants.appMainColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              alignment: Alignment.center,
              color: AppConstants.appMainColor,
              child: Lottie.asset("assets/Cart.json"),
            ),

            SizedBox(height: Get.height/30,),

            Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: userEmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: Get.height/30,),

            Material(
              child: Container(
                width: Get.width/2,
                height: Get.height/18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppConstants.appMainColor,
                ),
                child: TextButton(onPressed: () async{
                  String email =  userEmailController.text.trim();
                  if(email.isEmpty){
                    showSnackBar(title: "Error", message: 'Please fill the fields! ');
                  }
                  else{
                    // String email =  userEmailController.text.trim();
                    forgotPasswordController.forgotPasswordMethod(email);
                  }

                },
                    child: const Text('Forgot', style: TextStyle(color: AppConstants.appTextColor),)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

