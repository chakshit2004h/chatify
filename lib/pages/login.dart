import 'dart:developer';

import 'package:chatify/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size mq;
  bool _isAnimated = false;

  @override
  void initState(){
    super.initState();
      Future.delayed(const Duration(milliseconds: 500),(){
        setState(() {
          _isAnimated = true;
        });
      });

  }
  _handleGoogleAuthentication(){
    _signInWithGoogle().then((user){
      log("user : ${user?.user}");
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }
  Future<UserCredential?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null; // User cancelled the sign-in
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // Log the error
      print("Google Sign-In Error: $e");
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome to Chatify",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
        ),
      ),
      body: Stack(
        children: [
          // Top image
          AnimatedPositioned(
            top: mq.height * .10,
            width: mq.width * .7,
            right: _isAnimated ? mq.width * .16 : -mq.width * .7,
            duration: const Duration(seconds: 1),
            child: Image.asset("assets/images/chat.png"),
          ),
          // Elevated Button at the bottom
          Positioned(
            bottom: mq.height * .15,
            left: mq.width * .1,
            right: mq.width * .1,
            child: ElevatedButton.icon(
              onPressed: () {
               _handleGoogleAuthentication();
              },
              icon: Image.asset(
                "assets/images/google.png",
                height: 24, // Ensure the icon fits well
                width: 24,
              ),
              label: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.normal),
                  children: [
                    TextSpan(text: "Login with "),
                    TextSpan(
                      text: "Google",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
