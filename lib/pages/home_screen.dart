import 'dart:developer';

import 'package:chatify/pages/chat_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chatify",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 25),),
        leading: const Icon(CupertinoIcons.home),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add_comment_rounded,color: Colors.white,),

      ),
      body: StreamBuilder(
        stream: firestore.collection("users").snapshots(),
        builder: (context,snapshot){
          final list = [];
          if(snapshot.hasData){
            final data = snapshot.data?.docs;
            for(var i in data!){
              log("Data : ${i.data()}");
              list.add(i.data()['name']);
            }
          }
          return ListView.builder(
              itemCount: list.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return Text("Name : ${list[index]} ");
              }
          );
        },
      ),
    );
  }
}
