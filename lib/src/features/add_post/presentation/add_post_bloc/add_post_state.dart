// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_post_bloc.dart';

@immutable
sealed class AddPostState {}

final class AddPostInitial extends AddPostState {}

class AddPostSuccess extends AddPostState {}

class AddPostFailed extends AddPostState {
  final String errMessage;
  AddPostFailed({required this.errMessage});
}

class AddPostLoading extends AddPostState {}
