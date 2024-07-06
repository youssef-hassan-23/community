// ignore_for_file: public_member_api_docs, sort_constructors_first
class FeedEntity {
  String userName;
  String userImage;
  String caption;
  DateTime date;
  List images;
  FeedEntity({
    required this.userName,
    required this.userImage,
    required this.caption,
    required this.date,
    required this.images,
  });
  // ...
  // An entity represents a real-world object with a distinct identity.
}
