import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../core/parameters/parameters.dart';
import '../../data/implements/implements.dart';
import '../../data/sources/post_remote_datasource.dart';
import '../../domain/repositories/post_repositories.dart';
import '../../domain/usecases/upload_post.dart';
import '../provider/post_image_provider.dart';
part 'add_post_event.dart';
part 'add_post_state.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  AddPostBloc() : super(AddPostInitial()) {
    on<UploadPost>((event, emit) async {
      emit(AddPostLoading());
      PostsRepository response =
          PostsRepositoryImp(remoteDataSource: PostsRemoteDataSourceimpl());
      final postImagesUrls =
          await Provider.of<PostImageProvider>(event.context, listen: false)
              .uploeadImages(event.imagePaths);
      final postOrFailure = await UploadPostUsecase(repository: response).call(
          PostParameters(
              caption: event.caption,
              imageUrls: postImagesUrls,
              userImage: event.userImage,
              userName: event.userName));
      postOrFailure.fold(
          (failure) => emit(AddPostFailed(errMessage: failure.errorMessage)),
          (post) => emit(AddPostSuccess()));
    });
  }
}
