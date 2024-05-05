import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyshop_app/Models/UserModel.dart';
import 'package:easyshop_app/Widgets/MySnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserCredential?> signUpMethod(
      String userName,
      String userCity,
      String userPhone,
      String userEmail,
      String userPassword,
      String userToken,)
  async{
    try {
      //  show loading
      EasyLoading.show(status: 'Please Wait');
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: userEmail, password: userPassword);

      await userCredential.user!.sendEmailVerification(); // send email verification to user

      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          username: userName,
          email: userEmail,
          phone: userPhone,
          userImg: '',
          userDeviceToken: userToken,
          country: '',
          userAddress: '',
          street: 'street',
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now(),
          city: userCity,
      );

      //add data into database

      await firestore.collection('Users').doc(userCredential.user!.uid).set(userModel.toMap());

      //  dismiss loading
      EasyLoading.dismiss();
      return userCredential;

    } on FirebaseAuthException catch (e){
      //  dismiss loading
      EasyLoading.dismiss();
      showSnackBar(title: "Error", message: "$e");}
  }

}