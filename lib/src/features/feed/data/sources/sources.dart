import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/error/exceptions.dart';
import '../models/models.dart';

abstract interface class FeedRemoteDataSource {
  Future<List<FeedModel>> getPosts();
  // Make API call to fetch data and return object.
  // ...
}

class FeedRemoteDataSourceImpl implements FeedRemoteDataSource {
  @override
  Future<List<FeedModel>> getPosts() async {
    List<FeedModel> myPosts = [];
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("posts")
          .orderBy('date', descending: true)
          .get();
      for (var post in querySnapshot.docs) {
        myPosts.add(FeedModel.fromMap(post));
      }

      return myPosts;
    } catch (e) {
      throw ServerException();
    }
  }
}
