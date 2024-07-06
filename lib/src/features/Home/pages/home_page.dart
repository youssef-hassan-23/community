import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mica_community_2/src/features/Home/pages/profile_screen.dart';
import 'package:provider/provider.dart';
import '../../../core/providers/user_provider.dart';
import '../../add_post/presentation/pages/add_post_screen.dart';
import '../../chat/presentation/pages/chat_screen.dart';
import '../../feed/presentation/pages/feed_screen.dart';
import '../../search/presentation/pages/search_screen.dart';
import '../provider/pages_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      const FeedScreen(),
      SearchUserPage(),
      const AddPostScreen(),
      ChatScreen(),
    ];
    int _currentIndex = Provider.of<PagesProvider>(context).currentPage;

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.home),
          Icon(Icons.search),
          Icon(Icons.add),
          Icon(Icons.chat),
          IconButton(
            onPressed: () {
              userprofile(context: context);
            },
            icon: Icon(Icons.person),
          )
        ],
        height: 50,
        animationDuration: Duration(milliseconds: 500),
        backgroundColor: Colors.transparent,
        // buttonBackgroundColor:Colors.transparent ,
        color: Colors.blueGrey,
        onTap: (value) {
          if (value != 4) {
            Provider.of<PagesProvider>(context, listen: false)
                .changePage(value);
          }
        },
      ),
      body: pages[_currentIndex],
    );
  }
}
