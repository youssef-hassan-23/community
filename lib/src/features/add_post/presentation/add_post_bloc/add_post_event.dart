// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_post_bloc.dart';

@immutable
sealed class AddPostEvent {}

class UploadPost extends AddPostEvent {
  final String caption;
  final String userName;
  final String userImage;
  final List<File?> imagePaths;
  final BuildContext context;
  UploadPost({
    required this.caption,
    required this.userName,
    required this.userImage,
    required this.imagePaths,
    required this.context,
  });
}
