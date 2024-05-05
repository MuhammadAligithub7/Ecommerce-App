import 'package:easyshop_app/Controllers/SignInController.dart';
import 'package:easyshop_app/Screens/Auth/ForgotPassword.dart';
import 'package:easyshop_app/Screens/Auth/MainScreen.dart';
import 'package:easyshop_app/Screens/Auth/SignUpScreen.dart';
import 'package:easyshop_app/Utils/AppConstants.dart';
import 'package:easyshop_app/Widgets/MySnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  SignInController signInController = Get.put(SignInController());

  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign In"),
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

              Container(
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: userPasswordController,
                    obscureText: obscureText,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              obscureText = !obscureText;
                            });
                            },
                          child: obscureText? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 45.0),
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: (){
                      Get.to(const ForgotPasswordScreen());
                      },
                    child: const Text("Forgot Password", style: TextStyle(color: AppConstants.appSecondaryColor,fontWeight: FontWeight.bold),)),
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
                    String email = userEmailController.text.trim();
                    String password =  userPasswordController.text.trim();

                    if(email.isEmpty || password.isEmpty){
                      showSnackBar(title: "Error", message: 'Please fill all the fields! ');
                    }
                    else{
                      UserCredential? userCredential = await signInController.signInMethod(email, password);

                      if(userCredential != null){
                        if(userCredential.user!.emailVerified){
                          showSnackBar(title: "Success", message: 'Login Successfully! ');
                          Get.offAll(const MainScreen());
                        }
                        else{
                          showSnackBar(title: "Error", message: 'Please verify email before login! ');
                        }
                      }
                    }

                  },
                      child: const Text('Login ', style: TextStyle(color: AppConstants.appTextColor),)),
                ),
              ),

              SizedBox(height: Get.height/30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don`t have an account ', style: TextStyle(color: AppConstants.appSecondaryColor),),
                  InkWell(
                      onTap: (){
                        Get.off(const SignUpScreen());
                      },
                      child: const Text('Sign Up ', style: TextStyle(color: AppConstants.appSecondaryColor,fontWeight: FontWeight.bold),)),
                ],
              ),
            ],
          ),
        ),
      );
  }
}

