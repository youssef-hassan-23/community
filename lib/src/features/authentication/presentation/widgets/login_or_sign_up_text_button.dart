import 'package:flutter/material.dart';

class LoginOrSignUp extends StatelessWidget {
  final String title;
  final String message;
  final void Function()? onTap;
  const LoginOrSignUp({
    super.key,
    required this.title,
    required this.message,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(message),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:Colors.blueGrey)),
          ),
        ),
      ],
    );
  }
}
