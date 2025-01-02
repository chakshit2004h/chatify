import 'dart:async';

import 'package:chatify/pages/login.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Size mq;
  @override
  void initState(){
    super.initState();
      Timer(const Duration(seconds: 2,),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });

  }
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: mq.height*.15,
              width: mq.width* .8,
              left: mq.width* .1,
              child: Image.asset("assets/images/chat.png")
          ),
          Positioned(
              bottom: mq.height*.15,
              width: mq.width* .8,
              left: mq.width* .2,
              child: Text("Let's chat forever ❤️",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
