import 'package:clone/CustomUI/AvtarCard.dart';
import 'package:clone/CustomUI/ButtonCard.dart';
import 'package:clone/CustomUI/ContactCard.dart';
import 'package:clone/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  CreateGroup({Key key}) : super(key: key);
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
  List<ChatModel> groupmember = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Add Participants",
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
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: groupmember.length > 0 ? 90 : 10,
                );
              }
              return InkWell(
                onTap: () {
                  if (contacts[index - 1].select == false) {
                    setState(() {
                      contacts[index - 1].select = true;
                      groupmember.add(contacts[index - 1]);
                    });
                  } else {
                    setState(() {
                      contacts[index - 1].select = false;
                      groupmember.remove(contacts[index - 1]);
                    });
                  }
                },
                child: ContactCard(
                  contact: contacts[index - 1],
                ),
              );
            },
          ),
          groupmember.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          if (contacts[index].select == true) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  groupmember.remove(contacts[index]);
                                  contacts[index].select = false;
                                });
                              },
                              child: AvtarCard(
                                contact: contacts[index],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
