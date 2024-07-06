import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/feed_entities.dart';
import '../repositories/feed_repositories.dart';

class GetFeedUseCase {
  final FeedRepository repository;

  GetFeedUseCase(this.repository);

  // Future<User> execute(String userId) async {
  //   return userRepository.getUser(userId);
  // }
  Future<Either<Failure, List<FeedEntity>>> call() async {
    return await repository.getPosts();
  }
}
