import 'package:calculator/controller/authcontroller/googlecontroller.dart';
import 'package:calculator/view/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GoogleController googleController = Get.put(GoogleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(
  child: ElevatedButton(onPressed: () async{
  await  googleController.googleSignIn();
  
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
  
  }, child: Text("Signin with google"),),
),    );
  }
}
