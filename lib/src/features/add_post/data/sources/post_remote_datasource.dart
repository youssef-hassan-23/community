import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:path/path.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/parameters/parameters.dart';

abstract interface class PostsRemoteDataSource {
  // Make API call to fetch data and return object.
  // ...
  Future<void> upLoadPost(PostParameters parameters);
  Future<List<String>> upuloadPostImages(List<File?> images);
}

class PostsRemoteDataSourceimpl extends PostsRemoteDataSource {
  @override
  Future<void> upLoadPost(PostParameters parameters) async {
    // final data = await getUserInfo();
    try {
      await FirebaseFirestore.instance
          .collection("posts")
          .doc()
          .set(parameters.toMap());
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<String>> upuloadPostImages(List<File?> images) async {
    List<String> imageUrls = [];
    if (images != []) {
      for (var image in images) {
        final imagePath = basename(image!.path);
        Reference refStorage =
            await FirebaseStorage.instance.ref("posts/$imagePath");
        await refStorage.putFile(image);
        String url = await refStorage.getDownloadURL();
        imageUrls.add(url);
      }
    } else {
      throw CacheFailure(errorMessage: "you have pick at least one photo");
    }
    return imageUrls;
  }
}
