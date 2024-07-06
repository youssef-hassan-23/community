import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/auth_repositories.dart';

class GetLogin {
  final AuthenticationRepository repository;

  GetLogin({required this.repository});
  Future<Either<Failure, String>> call(
      {required String email, required String password}) async {
    return repository.login(email: email, password: password);
  }

  // Future<User> execute(String userId) async {
  //   return userRepository.getUser(userId);
  // }
}
