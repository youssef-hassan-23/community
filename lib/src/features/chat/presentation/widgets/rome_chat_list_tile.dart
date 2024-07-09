import 'package:flutter/material.dart';

import '../pages/massage_screen.dart';

class RomeChatListTile extends StatelessWidget {
  final String reciverName;
  final String reciverPhotoURL;
  final bool read;
  final String lastMassage;
  const RomeChatListTile(
      {super.key,
      required this.reciverName,
      required this.reciverPhotoURL,
      required this.lastMassage,
      required this.read});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MassageScreen(),
        ));
      },
      leading: CircleAvatar(),
      title: Text(
        reciverName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        children: [
          if (read)
            Icon(
              Icons.mark_chat_read,
              size: 15,
              color: Colors.grey,
            )
          else
            Icon(
              Icons.mark_chat_unread,
              size: 15,
              color: Colors.grey,
            ),
          SizedBox(
            width: 5,
          ),
          Text(
            lastMassage,
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
