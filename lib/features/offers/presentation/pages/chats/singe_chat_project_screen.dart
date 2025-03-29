import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

class SingleChatProjectScreen extends StatefulWidget {
  const SingleChatProjectScreen({super.key});

  @override
  State<SingleChatProjectScreen> createState() => _SingleChatProjectScreenState();
}

class _SingleChatProjectScreenState extends State<SingleChatProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: mediumTextApp("Elijah Walter", context),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Row(
                children: [
                  Expanded(child: normalTextApp("Donner le projet à ce prestataire", context)),
                  mainButtonApp(context, (){}, "OK", size: 0.05)
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  elevation: 2,
                  child: Container(
                    padding:EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        normalTextApp("Besoin d'un architecte pour ma maison", context),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Icon(EvaIcons.creditCard,color: AppColors.secondary,),
                                  Expanded(child: smallTextApp("10000F CFA",context))
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Row(
                                children: [
                                  Icon(EvaIcons.pin,color: AppColors.secondary,),
                                  Expanded(child: smallTextApp("115 bis avenue boueta mbongo Moungali", context))
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.circle, size: 15, color:AppColors.open,),
                                smallTextApp("Ouvert", context)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        smallTextApp("Le lorem ipsum (également appelé faux-texte, lipsum, ou bolo bolo[1]) est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page", context),
                        SizedBox(height: 10),
                        Row(
                          spacing: 10,
                          children: [
                            CircleAvatar(
                              radius: 10,
                              child: Icon(EvaIcons.calendar,color: AppColors.secondary, size: 15,)),
                            smallTextApp("Publié le : ", context),
                            Expanded(child: smallTextApp("25 janvier 2025", context)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ChatBubble(
                  message: "Je vais bien merci! Et toi?",
                  isMe: false,
                  time: "10:05"
                ),
                ChatBubble(
                  message: "Je vais bien aussi, merci!",
                  isMe: true,
                  time: "10:10"
                ),
                ChatBubble(
                  message: "Je vais bien merci! Et toi?",
                  isMe: false,
                  time: "10:05"
                ),
                ChatBubble(
                  message: "Je vais bien aussi, merci!",
                  isMe: true,
                  time: "10:10"
                ),
                ChatBubble(
                  message: "Je vais bien merci! Et toi?",
                  isMe: false,
                  time: "10:05"
                ),
                ChatBubble(
                  message: "Je vais bien aussi, merci!",
                  isMe: true,
                  time: "10:10"
                ),
                ChatBubble(
                  message: "Je vais bien merci! Et toi?",
                  isMe: false,
                  time: "10:05"
                ),
                ChatBubble(
                  message: "Je vais bien aussi, merci!",
                  isMe: true,
                  time: "10:10"
                ),
                ChatBubble(
                  message: "Je vais bien merci! Et toi?",
                  isMe: false,
                  time: "10:05"
                ),
                ChatBubble(
                  message: "Je vais bien aussi, merci!",
                  isMe: true,
                  time: "10:10"
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

