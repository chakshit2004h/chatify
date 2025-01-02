import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatCard extends StatefulWidget {
  const ChatCard({super.key});

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: (){},
        child: const ListTile(
          leading: CircleAvatar(child: Icon(CupertinoIcons.person),),
          title: Text("Demo",style: TextStyle(fontSize: 20),),
          subtitle: Text("Hi",style: TextStyle(color: Colors.grey,fontSize: 15),),
          trailing: Text("12:00 PM",style: TextStyle(color: Colors.grey,fontSize: 15),),
        ),
      ),
    );
  }
}
