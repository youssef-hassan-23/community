import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/pick_image.dart';
import '../../data/implements/implements.dart';
import '../../data/sources/post_remote_datasource.dart';
import '../../domain/repositories/post_repositories.dart';
import '../../domain/usecases/upload_post_images.dart';

class PostImageProvider with ChangeNotifier {
  List<File?> postImage = [];

  void selectedImages() async {
    final pickedImages = await pickMedia();
    if (pickedImages != []) {
      postImage = pickedImages;
    }
    notifyListeners();
  }

  void selectedCamera() async {
    final pickedImages = await pickImage(source: ImageSource.camera);
    if (pickedImages != null) {
      postImage = [];
      postImage.add(pickedImages);
    }
    notifyListeners();
  }

  Future<List<String>> uploeadImages(List<File?> imagesPaths) async {
    PostsRepository repository =
        await PostsRepositoryImp(remoteDataSource: PostsRemoteDataSourceimpl());
    final urls =
        await UploadPostImagesUsecase(repository: repository).call(imagesPaths);
    return urls;
  }

  clearImages() {
    postImage = [];
    notifyListeners();
  }
}
