import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({super.key});

  @override
  State<SingleChatScreen> createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: mediumTextApp("Elijah Walter", context),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ChatBubble(
                  message: "Bonjour, comment ça va?",
                  isMe: false,
                  time: "10:00"
                ),
                ChatBubble(
                  message: "Je vais bien merci! Et toi?",
                  isMe: true,
                  time: "10:05"
                ),
                ChatBubble(
                  message: "Je vais bien aussi, merci!",
                  isMe: false,
                  time: "10:10"
                ),
                ChatBubble(
                  message: "J'ai bésoin d'un service",
                  isMe: true,
                  time: "10:15"
                ),
                ChatBubble(
                  message: "Lequel, je t'écoute",
                  isMe: false,
                  time: "10:00"
                ),
                ChatBubble(
                  message: "J'ai une télé qui a un problème",
                  isMe: true,
                  time: "10:05"
                ),
                ChatBubble(
                  message: "Tu peux me trouver un reparateur?",
                  isMe: true,
                  time: "10:05"
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Entrer votre message",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(EvaIcons.attach),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(EvaIcons.paperPlane),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )
        ]
      )
    );
  }
}


class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.isMe, required this.message, required this.time});
  final bool isMe;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isMe ? AppColors.secondary : Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: isMe ? Radius.circular(20) : Radius.circular(0),
                bottomRight: isMe ? Radius.circular(0) : Radius.circular(20)
              )
            ),
            child: Column(
              crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(message, style: TextStyle(fontSize: 16, color: isMe ? Colors.white : Colors.black),),
                SizedBox(height: 5),
                Text(time, style: TextStyle(fontSize: 12, color: isMe ? Colors.white : Colors.black),),
              ],
            ),
          )
        ],
      ),
    );
  }
}