import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/parameters/parameters.dart';

abstract class PostsRepository {
  // Future<User> getUser(String userId);
  Future<Either<Failure, void>> upLoeadPost(PostParameters parameters);
  Future<List<String>> upLoeadPostImages(List<File?> imagesPaths);
}
