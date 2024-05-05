import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyshop_app/Widgets/MySnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> forgotPasswordMethod(String userEmail,)
  async{
    try {
      //  show loading
      EasyLoading.show(status: 'Please Wait');
      await auth.sendPasswordResetEmail(email: userEmail);
      showSnackBar(title: "Sent Successfully !", message: "Password Reset link sent to $userEmail");
      //  dismiss loading
      EasyLoading.dismiss();

    } on FirebaseAuthException catch (e){
      //  dismiss loading
      EasyLoading.dismiss();
      showSnackBar(title: "Error", message: "$e");
    }
  }

}