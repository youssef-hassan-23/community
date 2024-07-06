import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/parameters/parameters.dart';
import '../repositories/post_repositories.dart';

class UploadPostUsecase {
  final PostsRepository repository;

  UploadPostUsecase({required this.repository});

  // Future<User> execute(String userId) async {
  //   return userRepository.getUser(userId);
  // }
  Future<Either<Failure, void>> call(PostParameters parameters) async {
    return await repository.upLoeadPost(parameters);
  }
}
