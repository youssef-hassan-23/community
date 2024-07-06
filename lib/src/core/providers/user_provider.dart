import 'package:flutter/widgets.dart';

import '../utils/get_user_info.dart';

class UserProvider with ChangeNotifier {
  bool primaryModeTheme = true;
  String userName = '';
  String userImage = '';

  void changeAppTheme() {
    primaryModeTheme = !primaryModeTheme;
    notifyListeners();
  }

  void getUserData() async {
    final userData = await getUserInfo();
    userName = userData!['name'];
    userImage = userData['profilePicture'];
    notifyListeners();
  }
}
