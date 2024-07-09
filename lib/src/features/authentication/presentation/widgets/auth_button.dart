import 'package:flutter/material.dart';
class AuthButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const AuthButton({
    super.key,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: ShapeDecoration(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            color: Colors.blueGrey,
          ),
          child: child),
    );
  }
}
