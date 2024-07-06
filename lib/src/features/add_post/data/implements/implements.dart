import 'dart:io';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/parameters/parameters.dart';
import '../sources/post_remote_datasource.dart';
import '../../domain/repositories/post_repositories.dart';

class PostsRepositoryImp implements PostsRepository {
  final PostsRemoteDataSource remoteDataSource;
  PostsRepositoryImp({required this.remoteDataSource});
  @override
  Future<List<String>> upLoeadPostImages(List<File?> imagesPaths) async {
    final imagesUrls = await remoteDataSource.upuloadPostImages(imagesPaths);
    return imagesUrls;
  }

  @override
  Future<Either<Failure, void>> upLoeadPost(PostParameters parameters) async {
    try {
      final post = await remoteDataSource.upLoadPost(parameters);
      return right(post);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    } on CacheException catch (e) {
      return left(CacheFailure(errorMessage: e.toString()));
    }
  }
}
