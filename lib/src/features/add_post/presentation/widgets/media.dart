import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/post_image_provider.dart';
import 'image_widget.dart';
import 'media_picker.dart';

class Media extends StatefulWidget {
  const Media({
    super.key,
  });

  @override
  State<Media> createState() => _MediaState();
}

class _MediaState extends State<Media> {
  @override
  Widget build(BuildContext context) {
    List<File?> images = Provider.of<PostImageProvider>(context).postImage;
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          MediaPicker(
              icon: Icon(Icons.camera_alt_outlined, size: 30),
              title: "Camera",
              onTap: () {
                Provider.of<PostImageProvider>(context, listen: false)
                    .selectedCamera();
              }),
          MediaPicker(
              icon: Icon(Icons.photo_outlined, size: 30),
              title: "Gallary",
              onTap: () {
                Provider.of<PostImageProvider>(context, listen: false)
                    .selectedImages();
              }),
          if (images != [])
            for (int x = 0; x < images.length; x++)
              ImageWidget(path: images[x]!)
        ],
      ),
    );
  }
}
