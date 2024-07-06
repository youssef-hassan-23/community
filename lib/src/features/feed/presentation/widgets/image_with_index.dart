import 'package:flutter/material.dart';

class ImageWithIndex extends StatelessWidget {
  final String image;
  final int currentIndex;
  final int totalImages;

  const ImageWithIndex({
    required this.image,
    required this.currentIndex,
    required this.totalImages,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            color: Colors.black54,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              '$currentIndex / $totalImages',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
