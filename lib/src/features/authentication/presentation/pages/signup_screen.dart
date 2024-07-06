import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../core/providers/user_provider.dart';
import '../../../../core/utils/pick_image.dart';
import '../provider/sign_up_provider.dart';
import '../widgets/login_or_sign_up_text_button.dart';
import '../widgets/auth_button.dart';
import '../widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formState = GlobalKey();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  File? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
  }

  selectImage() async {
    final pic = await pickImage(source: ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    if (pic != null) {
      setState(() {
        _image = pic;
      });
    } else {
      setState(() {
        _image = File("assets/l60Hf.png");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = Provider.of<SignUpProvider>(context).isLoading;
    return Scaffold(

      // loading or body
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Form(
            key: _formState,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // mica dark or light
                  context.watch<UserProvider>().primaryModeTheme
                      ? Image.asset(
                          "assets/MICA Light.jpg",
                          height: 100,
                        )
                      : Image.asset(
                          "assets/MICA Dark.jpg",
                          height: 100,
                        ),
                  const SizedBox(height: 64),
                  Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage: FileImage(_image!),
                              backgroundColor: Colors.grey,
                            )
                          : const CircleAvatar(
                              radius: 64,
                              backgroundImage: NetworkImage(
                                  'https://i.stack.imgur.com/l60Hf.png'),
                              backgroundColor: Colors.grey,
                            ),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: () {
                            selectImage();
                          },
                          icon: const Icon(Icons.add_a_photo),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  // fields
                  TextFieldInput(
                    hintText: 'Enter your username',
                    textInputType: TextInputType.text,
                    textEditingController: _userNameController,
                  ),
                  const SizedBox(height: 24),
                  TextFieldInput(
                    hintText: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _emailController,
                  ),
                  const SizedBox(height: 24),
                  TextFieldInput(
                    hintText: 'Enter your password',
                    textInputType: TextInputType.text,
                    textEditingController: _passwordController,
                    isPass: true,
                  ),
                  const SizedBox(height: 24),
                  // button
                  AuthButton(
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Text("SIGN UP"),
                    onTap: () {
                      if (_formState.currentState!.validate()) {
                        Provider.of<SignUpProvider>(context, listen: false)
                            .signUpOrFailure(
                                photoPath: _image,
                                context: context,
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                                userName: _userNameController.text.trim());
                      }
                    },
                  ),
                  const SizedBox(height: 12),

                  // do you have account
                  LoginOrSignUp(
                    title: "Login",
                    message: "Already have an account? ",
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
