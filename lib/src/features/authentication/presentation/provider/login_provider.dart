import 'package:flutter/material.dart';

import '../../../../core/utils/show_snak_bar.dart';

import '../../../Home/pages/home_page.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginProvider extends ChangeNotifier {
  GetLogin getLogin;
  bool isLoading = false;
  LoginProvider(this.getLogin);
  Future<void> loginOrFailure({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();
    final signUpOrFailure =
        await getLogin.call(email: email, password: password);
    isLoading = false;
    notifyListeners();
    signUpOrFailure.fold((newFailure) {
      showSnackBar(context, newFailure.errorMessage);
    }, (newUser) async {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    });
  }
}
