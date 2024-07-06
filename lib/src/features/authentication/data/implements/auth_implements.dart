import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/failure.dart';
import '../models/models.dart';
import '../sources/auth_remote_datesources.dart';
import '../../domain/repositories/auth_repositories.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> login(
      {required String email, required String password}) async {
    try {
      final newUser =
          await remoteDataSource.login(email: email, password: password);
      return right(newUser);
    } on FirebaseAuthException catch (e) {
      return left(CacheFailure(errorMessage: e.code));
    } catch (e) {
      return left(CacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthenticationModel>> signUp({
    required String userName,
    required String email,
    required String password,
    required File? photoPath,
  }) async {
    try {
      final newUser = await remoteDataSource.signUp(
          userName: userName,
          email: email,
          password: password,
          photoPath: photoPath);
      remoteDataSource.uploadUserData(newUser);
      return right(newUser);
    } on FirebaseAuthException catch (e) {
      return left(CacheFailure(errorMessage: e.code));
    } catch (e) {
      return left(CacheFailure(errorMessage: e.toString()));
    }
  }

  // ... example ...
  //
  // Future<User> getUser(String userId) async {
  //     return remoteDataSource.getUser(userId);
  //   }
  // ...
}
