import 'package:flutter/material.dart';
import 'package:mossala_mobile/features/chats/presentation/pages/chats_screen.dart';
import 'package:mossala_mobile/features/offers/presentation/pages/chats/singe_chat_project_screen.dart';
import 'package:mossala_mobile/widgets/app_bar.dart';

class ChatsProjectScreen extends StatefulWidget {
  const ChatsProjectScreen({super.key});

  @override
  State<ChatsProjectScreen> createState() => _ChatsProjectScreenState();
}

class _ChatsProjectScreenState extends State<ChatsProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Messages", context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            2,
            (index) => CardItemChats(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SingleChatProjectScreen(),
                ),
              );
            },),
          ),
        ),
      ),
    );
  }
}