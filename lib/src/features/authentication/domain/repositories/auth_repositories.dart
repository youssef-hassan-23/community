import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/entities.dart';

abstract class AuthenticationRepository {
  // Future<User> getUser(String userId);
  Future<Either<Failure, AuthenticationEntity>> signUp(
      {required String userName,
      required String email,
      required String password,
      required File? photoPath});
  Future<Either<Failure, String>> login(
      {required String email, required String password});
}
