import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../Home/provider/pages_provider.dart';
import '../add_post_bloc/add_post_bloc.dart';
import '../provider/post_image_provider.dart';
import '../widgets/media.dart';
import '../widgets/post_body.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostImageProvider>(context, listen: false).clearImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AddPostBloc, AddPostState>(
        listener: (context, state) {
          if (state is AddPostSuccess) {
            Provider.of<PagesProvider>(context, listen: false).changePage(0);
          }
        },
        builder: (context, state) {
          if (state is AddPostLoading) {
            return Center(child: Text("Loading..."));
          }
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // post body
                  PostBody(),
                  Spacer(),
                  // media
                  Media()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
