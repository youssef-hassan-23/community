import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/login_provider.dart';
import '../widgets/login_or_sign_up_text_button.dart';
import '../widgets/auth_button.dart';
import 'signup_screen.dart';
import '../widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formState = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = Provider.of<LoginProvider>(context).isLoading;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Form(
            key: _formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(flex: 2, child: Container()),
                // logo
                Text("MICA",
                    style: TextStyle(
                        fontFamily: 'DancingScript', color: Colors.blueGrey,fontSize: 60)),
                const SizedBox(height: 64),
                // fields
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
                AuthButton(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text("LOGIN"),
                  onTap: () {
                    if (_formState.currentState!.validate()) {
                      Provider.of<LoginProvider>(context, listen: false)
                          .loginOrFailure(
                        context: context,
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );
                    }
                  },
                ),
                const SizedBox(height: 12),
                Flexible(flex: 2, child: Container()),
                // go to sign up
                LoginOrSignUp(
                  title: "Signup",
                  message: "Don't have an account? ",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignupScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
