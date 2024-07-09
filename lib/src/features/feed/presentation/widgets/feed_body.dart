import 'package:flutter/material.dart';
import '../../../../core/utils/format_date.dart';
import '../bloc/feed_bloc.dart';
import 'full_screen_image_page.dart';
import 'image_with_index.dart';

class FeedBody extends StatelessWidget {
  final FeedSuccess state;
  const FeedBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          titleSpacing: 0,
          title: Text("MICA",
              style: TextStyle(
                  fontFamily: 'DancingScript',
                  color: Colors.blueGrey,
                  fontSize: 50)),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.info_outline_rounded))
          ],
        ),
        for (int i = 0; i < state.posts.length; i++)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(state.posts[i].userImage),
                        backgroundColor: Colors.grey,
                        radius: 25,
                      ),
                      SizedBox(width: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            state.posts[i].userName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(formatTime(state.posts[i].date),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(state.posts[i].caption, maxLines: 10),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 400,
                    child: PageView.builder(
                      itemCount: state.posts[i].images.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenImagePage(
                                  imageUrls: state.posts[i].images,
                                  initialIndex: index),
                            ),
                          );
                        },
                        child: ImageWithIndex(
                          image: state.posts[i].images[index],
                          currentIndex: index + 1,
                          totalImages: state.posts[i].images.length,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border_outlined)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.insert_comment_sharp)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
