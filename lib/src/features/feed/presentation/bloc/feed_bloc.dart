import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/connection/InterNet_Connection.dart';
import '../../domain/entities/feed_entities.dart';
import '../../domain/usecases/feed_usecases.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  GetFeedUseCase getFeedUseCase;
  FeedBloc(this.getFeedUseCase) : super(FeedInitial()) {
    on<GetPosts>((event, emit) async {
      if (await NetworkInfoImpl(DataConnectionChecker()).isConnected == true) {
        emit(FeedLoading());
        final postsOrFailure = await getFeedUseCase.call();
        postsOrFailure.fold((failure) {
          emit(FeedFailed(errMessage: failure.errorMessage));
        }, (posts) {
          emit(FeedSuccess(posts));
        });
      } else {
        emit(FeedFailed(errMessage: "No internet connection"));
      }
    });
  }
}
