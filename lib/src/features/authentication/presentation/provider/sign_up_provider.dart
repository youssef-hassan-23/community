import 'dart:io';
import 'package:flutter/material.dart';

import '../../../../core/utils/show_snak_bar.dart';

import '../../../Home/pages/home_page.dart';
import '../../data/implements/auth_implements.dart';
import '../../data/sources/auth_remote_datesources.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../../domain/usecases/sign_up_usecases.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  Future<void> signUpOrFailure(
      {required BuildContext context,
      required String email,
      required String password,
      required String userName,
      required File? photoPath}) async {
    isLoading = true;
    notifyListeners();
    AuthenticationRepository response = AuthenticationRepositoryImp(
        remoteDataSource: AuthenticationRemoteDataSourceimpl());
    final signUpOrFailure = await GetSignUp(repository: response).call(
        email: email,
        password: password,
        userName: userName,
        photoPath: photoPath);
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
