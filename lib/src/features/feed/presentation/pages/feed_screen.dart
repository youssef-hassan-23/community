import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/feed_bloc.dart';
import '../widgets/feed_body.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    BlocProvider.of<FeedBloc>(context, listen: false).add(GetPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    return Scaffold(
      body: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          if (state is FeedSuccess) {
            widget = FeedBody(state: state);
          } else if (state is FeedFailed) {
            widget = Center(child: Text(state.errMessage));
          } else {
            widget = Center(child: Text("Loading..."));
          }
          return widget;
        },
      ),
    );
  }
}
