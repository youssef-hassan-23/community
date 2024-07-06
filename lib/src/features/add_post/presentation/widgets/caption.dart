// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/providers/user_provider.dart';

class Caption extends StatelessWidget {
  final TextEditingController captionController;
  Caption({
    Key? key,
    required this.captionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userImage = Provider.of<UserProvider>(context).userImage;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(userImage),
          backgroundColor: Colors.grey,
          radius: 25,
        ),
        SizedBox(width: 5),
        Expanded(
          child: TextField(
            controller: captionController,
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Add caption....",
              hintStyle: TextStyle(
                fontSize: 20,
                color: context.watch<UserProvider>().primaryModeTheme
                    ? AppColor.greyColor
                    : AppColor.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
