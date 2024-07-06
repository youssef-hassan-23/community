part of 'feed_bloc.dart';

@immutable
abstract class FeedEvent {}

class GetPosts extends FeedEvent {}
