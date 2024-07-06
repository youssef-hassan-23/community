import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/entities.dart';
import '../repositories/auth_repositories.dart';

class GetSignUp {
  final AuthenticationRepository repository;

  GetSignUp({required this.repository});
  Future<Either<Failure, AuthenticationEntity>> call(
      {required String userName,
      required String email,
      required String password,
      required File? photoPath}) async {
    return repository.signUp(
        userName: userName,
        email: email,
        password: password,
        photoPath: photoPath);
  }
  // Future<User> execute(String userId) async {
  //   return userRepository.getUser(userId);
  // }
}
