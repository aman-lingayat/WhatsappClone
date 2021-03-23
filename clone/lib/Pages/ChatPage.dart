import 'package:clone/CustomUI/CustomCard.dart';
import 'package:clone/Model/ChatModel.dart';
import 'package:clone/Screens/SelectContact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Jack",
      isGroup: false,
      currentMessage: "Hello",
      time: "4:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Benjimin",
      isGroup: false,
      currentMessage: "Hello Benjimin",
      time: "4:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Vladimir",
      isGroup: false,
      currentMessage: "Hello Vladimir",
      time: "10:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Group chat",
      isGroup: true,
      currentMessage: "Hello evryone on this group",
      time: "10:00",
      icon: "group.svg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(chatModel: chats[index]),
      ),
    );
  }
}
