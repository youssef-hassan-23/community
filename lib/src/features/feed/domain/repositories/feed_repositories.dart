import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/feed_entities.dart';

abstract class FeedRepository {
  // Future<User> getUser(String userId);
  Future<Either<Failure, List<FeedEntity>>> getPosts();
}
