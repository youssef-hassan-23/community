import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImagePage extends StatelessWidget {
  final List imageUrls;
  final int initialIndex;

  const FullScreenImagePage(
      {required this.imageUrls, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: initialIndex);

    Future<void> saveImage(String url) async {
      await GallerySaver.saveImage(url);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image saved to gallery')),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return PhotoView(
                imageProvider: NetworkImage(imageUrls[index]),
                backgroundDecoration: BoxDecoration(color: Colors.black),
              );
            },
          ),
          Positioned(
            top: 40,
            right: 20,
            child: PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: Colors.white),
              onSelected: (value) async {
                if (value == 'save') {
                  int currentIndex =
                      pageController.page?.round() ?? initialIndex;
                  await saveImage(imageUrls[currentIndex]);
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'save',
                    child: Text('Save Image'),
                  ),
                ];
              },
            ),
          ),
        ],
      ),
    );
  }
}
