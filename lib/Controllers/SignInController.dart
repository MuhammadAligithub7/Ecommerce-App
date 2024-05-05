import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyshop_app/Widgets/MySnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserCredential?> signInMethod(
      String userEmail,
      String userPassword,
      )
  async{
    try {
      //  show loading
      EasyLoading.show(status: 'Please Wait');
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: userEmail, password: userPassword);
      //  dismiss loading
      EasyLoading.dismiss();
      return userCredential;

    } on FirebaseAuthException catch (e){
      //  dismiss loading
      EasyLoading.dismiss();
      showSnackBar(title: "Error", message: "$e");}
  }

}