import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';
import '../../../../core/constants/colors.dart';

import '../../../../core/providers/user_provider.dart';
import '../../../../core/utils/show_snak_bar.dart';
import '../../../Home/provider/pages_provider.dart';
import '../add_post_bloc/add_post_bloc.dart';
import '../provider/post_image_provider.dart';

class PostBody extends StatefulWidget {
  PostBody({super.key});

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController captionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<File?> images = Provider.of<PostImageProvider>(context).postImage;
    final userName = Provider.of<UserProvider>(context).userName;
    final userImage = Provider.of<UserProvider>(context).userImage;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //post button
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Provider.of<PagesProvider>(context, listen: false)
                        .changePage(0);
                  },
                  icon: Icon(Icons.close, color: Colors.blue, size: 30)),
              Spacer(),
              MaterialButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<AddPostBloc>(context, listen: false).add(
                        UploadPost(
                            caption: captionController.text.trim(),
                            userName: userName,
                            userImage: userImage,
                            imagePaths: images,
                            context: context));
                  } else {
                    showSnackBar(context, "choose your photos first");
                  }
                },
                color: Colors.blue,
                child: Text("post", style: TextStyle(fontSize: 18)),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
              ),
            ],
          ),
          SizedBox(height: 10),
          // caption
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(userImage),
                backgroundColor: Colors.grey,
                radius: 25,
              ),
              SizedBox(width: 5),
              Expanded(
                child: TextFormField(
                  maxLines: null,
                  validator: (value) {
                    if (value!.isEmpty && images.length == 0) {
                      return "";
                    }
                    return null;
                  },
                  controller: captionController,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Add caption....",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: context.watch<UserProvider>().primaryModeTheme
                          ? AppColor.greyColor
                          : AppColor.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
