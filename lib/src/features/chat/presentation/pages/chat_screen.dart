import 'package:flutter/material.dart';

import '../widgets/rome_chat_list_tile.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (int i = 0; i < 50; i++)
            RomeChatListTile(
              lastMassage: "hi",
              reciverName: "mohamed",
              reciverPhotoURL: "",
              read: i % 2 == 0 ? true : false,
            ),
        ],
      ),
    );
  }
}
