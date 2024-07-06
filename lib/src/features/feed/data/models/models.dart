import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/feed_entities.dart';

class FeedModel extends FeedEntity {
  FeedModel(
      {required super.userName,
      required super.userImage,
      required super.caption,
      required super.date,
      required super.images});
  factory FeedModel.fromMap(QueryDocumentSnapshot<Map<String, dynamic>> map) {
    Timestamp timestamp = map['date'];
    return FeedModel(
        userName: map['userName'],
        userImage: map['userImage'],
        caption: map['caption'],
        date: timestamp.toDate(),
        images: List.from(
          (map['imagePaths']),
        ));
  }
  // ...
  // A model is a more generic term and can represent structured data used within an application.
  // ...
  // fromJson
  // ...
  // toJson
}
