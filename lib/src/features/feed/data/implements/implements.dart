import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/feed_entities.dart';
import '../sources/sources.dart';
import '../../domain/repositories/feed_repositories.dart';

class FeedRepositoryImp implements FeedRepository {
  final FeedRemoteDataSource remoteDataSource;
  FeedRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, List<FeedEntity>>> getPosts() async {
    try {
      final posts = await remoteDataSource.getPosts();
      return right(posts);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  // ... example ...
  //
  // Future<User> getUser(String userId) async {
  //     return remoteDataSource.getUser(userId);
  //   }
  // ...
}
