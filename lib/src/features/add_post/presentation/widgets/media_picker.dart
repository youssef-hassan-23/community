import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/providers/user_provider.dart';

class MediaPicker extends StatelessWidget {
  final void Function()? onTap;
  final Icon icon;
  final String title;
  const MediaPicker({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(
                color: context.watch<UserProvider>().primaryModeTheme
                    ? AppColor.secondaryColor
                    : AppColor.primaryColor),
            borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          icon,
          Text(title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: context.watch<UserProvider>().primaryModeTheme
                    ? AppColor.secondaryColor
                    : AppColor.primaryColor,
              ))
        ]),
      ),
    );
  }
}
