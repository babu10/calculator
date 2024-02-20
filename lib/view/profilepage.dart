import 'package:calculator/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/authcontroller/googlecontroller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GoogleController googleController = Get.put(GoogleController());

  late User? user;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(user!.photoURL.toString()),
            ),
            ListTile(title: Text(user!.displayName.toString())),
            ListTile(title: Text(user!.email.toString())),
            ListTile(
              title: Text(user!.phoneNumber.toString()),
            ),
            // ListTile(
            //   title: Text(user!.uid.toString()),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(18.0),
            //   child: Text(user!.emailVerified.toString()),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(18.0),
            //   child: Text(user!.photoURL.toString()),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(18.0),
            //   child: Text(user!.isAnonymous.toString()),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(18.0),
            //   child: Text(user!.getIdToken().toString()),
            // ),
            ListTile(
              onTap: () => googleController.googleSignOut(),
              title: Text("LogOut")),


          ],
        ),
      ),
    );
  }
}
