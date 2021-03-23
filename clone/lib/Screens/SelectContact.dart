import 'package:clone/CustomUI/ButtonCard.dart';
import 'package:clone/CustomUI/ContactCard.dart';
import 'package:clone/Model/ChatModel.dart';
import 'package:clone/Screens/CreateGroup.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  SelectContact({Key key}) : super(key: key);
  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(name: "Dev Stack", status: "A Full stack developer"),
      ChatModel(name: "Vladimir Putin", status: "A Gangster"),
      ChatModel(name: "John", status: "The Don"),
      ChatModel(name: "Ben", status: "with 10 alien"),
      ChatModel(name: "Larry", status: "the page"),
      ChatModel(name: "sergey", status: "The Brin"),
      ChatModel(name: "Saurav sir", status: "@Videtorrium"),
      ChatModel(name: "Jogi John", status: "AWA"),
      ChatModel(name: "Elon", status: "The Rocket Man"),
      ChatModel(name: "Jeff", status: "Amazon"),
      ChatModel(name: "Joe Biden", status: "President of USA"),
      ChatModel(name: "John Cena", status: "@WWE"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "50 Contacts",
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                size: 26,
              ),
              onPressed: () {}),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: "Invite a friend",
                ),
                PopupMenuItem(
                  child: Text("Contacts"),
                  value: "Contacts",
                ),
                PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => CreateGroup()));
              },
              child: ButtonCard(
                icon: Icons.group,
                name: "New Group",
              ),
            );
          } else if (index == 1) {
            return ButtonCard(
              icon: Icons.person,
              name: "New Contact",
            );
          }
          return ContactCard(
            contact: contacts[index - 2],
          );
        },
      ),
    );
  }
}
