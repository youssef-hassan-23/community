import 'package:flutter/material.dart';


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
                color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          icon,
          Text(title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color:Colors.blueGrey
              ))
        ]),
      ),
    );
  }
}
