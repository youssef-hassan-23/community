import 'dart:io';

import '../repositories/post_repositories.dart';

class UploadPostImagesUsecase {
  final PostsRepository repository;

  UploadPostImagesUsecase({required this.repository});

  // Future<User> execute(String userId) async {
  //   return userRepository.getUser(userId);
  // }
  Future<List<String>> call(List<File?> imagesPaths) async {
    return await repository.upLoeadPostImages(imagesPaths);
  }
}
