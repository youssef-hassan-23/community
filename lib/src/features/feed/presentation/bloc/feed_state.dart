part of 'feed_bloc.dart';

@immutable
abstract class FeedState {}

class FeedInitial extends FeedState {}

class FeedSuccess extends FeedState {
  final List<FeedEntity> posts;
  FeedSuccess(this.posts);
}

class FeedFailed extends FeedState {
  final String errMessage;
  FeedFailed({required this.errMessage});
}

class FeedLoading extends FeedState {}
