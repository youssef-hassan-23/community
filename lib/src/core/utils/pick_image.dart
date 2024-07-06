library utils;

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage({required ImageSource source}) async {
  try {
    final respones = await ImagePicker().pickImage(source: source);
    if (respones != null) {
      return File(respones.path);
    }
    return null;
  } catch (e) {
    return null;
  }
}

Future<List<File?>> pickMedia() async {
  List<File?> images = [];
  try {
    final respones = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: true);
    if (respones != null) {
      for (int i = 0; i < respones.xFiles.length; i++) {
        images.add(File(respones.xFiles[i].path));
      }
      return images;
    }
    return [];
  } catch (e) {
    return [];
  }
}
// // for picking up image from gallery
// pickTheImage(ImageSource source) async {
//   final ImagePicker imagePicker = ImagePicker();
//   XFile? file = await imagePicker.pickImage(source: source);
//   if (file != null) {
//     return await file.readAsBytes();
//   }
// }
