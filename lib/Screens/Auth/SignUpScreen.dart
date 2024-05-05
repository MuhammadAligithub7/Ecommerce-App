import 'package:easyshop_app/Controllers/SignUpController.dart';
import 'package:easyshop_app/Screens/Auth/SignInScreen.dart';
import 'package:easyshop_app/Utils/AppConstants.dart';
import 'package:easyshop_app/Widgets/MySnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final SignUpController signUpController = Get.put(SignUpController());

  TextEditingController userNameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userCityController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
          backgroundColor: AppConstants.appMainColor,
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 160,
                alignment: Alignment.center,
                color: AppConstants.appMainColor,
                child: Lottie.asset("assets/Cart.json"),
              ),

              SizedBox(height: Get.height/300,),

              Container(
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: userNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "User Name",
                      prefixIcon: const Icon(Icons.person),
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
                    controller: userCityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "City",
                      prefixIcon: const Icon(Icons.location_pin),
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
                    controller: userPhoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Phone",
                      prefixIcon: const Icon(Icons.phone),
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

              SizedBox(height: Get.height/30,),

              Material(
                child: Container(
                  width: Get.width/2,
                  height: Get.height/18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppConstants.appMainColor,
                  ),
                  child: TextButton(onPressed: () async {
                    String name = userNameController.text.trim();
                    String city = userCityController.text.trim();
                    String phone = userPhoneController.text.trim();
                    String email = userEmailController.text.trim();
                    String password = userPasswordController.text.trim();
                    String userDeviceToken = '';

                    if(name.isEmpty || city.isEmpty || phone.isEmpty || email.isEmpty || password.isEmpty)
                      {
                        showSnackBar(title: 'Error', message: 'Please Fill all the Fields!');
                      }
                    else{
                      UserCredential? userCredential = await SignUpController().signUpMethod(
                          name,
                          city,
                          phone,
                          email,
                          password,
                          userDeviceToken
                      );

                      FirebaseAuth.instance.signOut();
                      Get.offAll(const SigninScreen());

                      if(userCredential != null)
                        {
                          showSnackBar(title: 'Verification', message: 'Please check your email.');

                        }
                    }

                  },
                      child: const Text('Sign Up ', style: TextStyle(color: AppConstants.appTextColor),)),
                ),
              ),

              SizedBox(height: Get.height/30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account ', style: TextStyle(color: AppConstants.appSecondaryColor),),
                  InkWell(
                      onTap: (){
                        Get.to(const SigninScreen());
                      },
                      child: const Text('Sign In ', style: TextStyle(color: AppConstants.appSecondaryColor, fontWeight: FontWeight.bold),)),
                ],
              ),

            ],
          ),
        ),
      );
  }
}

