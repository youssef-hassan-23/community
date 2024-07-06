import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/providers/user_provider.dart';
import '../../authentication/presentation/pages/login_screen.dart';

Future<dynamic> userprofile({required BuildContext context}) async {
  final userName = Provider.of<UserProvider>(context, listen: false).userName;
  final userImage = Provider.of<UserProvider>(context, listen: false).userImage;
  return showModalBottomSheet(
      backgroundColor: AppColor.primaryColor,
      context: context,
      builder: (context) => Container(
            height: 310,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(userImage),
                        backgroundColor: Colors.grey,
                        radius: 50,
                      ),
                      SizedBox(height: 5),
                      Text(
                        userName,
                        style: TextStyle(
                          color: AppColor.secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mode_night_sharp,
                        color: Colors.grey[800],
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Dark Mode",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: SizedBox()),
                      Switch(
                        activeColor: Colors.black,
                        value: !context.watch<UserProvider>().primaryModeTheme,
                        onChanged: (value) {
                          Provider.of<UserProvider>(context, listen: false)
                              .changeAppTheme();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.manage_accounts,
                        color: Colors.grey[800],
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Manage account",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[500],
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Colors.redAccent),
                        SizedBox(width: 10),
                        Text(
                          "Log Out ",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(Icons.arrow_forward_ios, color: Colors.grey[500])
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
}
