// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import '../../resources/widget/custom_text_field.dart';
import 'login_image.dart';
import 'package:http/http.dart' as http;

/// Flutter code sample for [ScaleTransition].

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final TextEditingController userController = TextEditingController();
  FocusNode focusNodeUser = FocusNode();
  final String _errorTextUser = '';
  final TextEditingController passwordController = TextEditingController();
  FocusNode focusNodePassword = FocusNode();
  final String _errorTextPassword = '';
  bool _obscureText = true;
  IconData iconData = Icons.remove_red_eye;
  var formKey = GlobalKey<FormState>();
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: formKey,
            child: ListView(
              children: [
                const LoginImage(),
                Center(
                  child: Text(
                    'Welcome back',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                const Center(
                  child: Text(
                    'login to your account',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                CustomTextField(
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your Username ';
                    }
                    return null;
                  },
                  controller: userController,
                  height: 'user Name',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icon(Icons.person_2,
                      color: Theme.of(context).colorScheme.primary),
                ),
                CustomTextField(
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your Passwords ';
                    }
                    return null;
                  },
                  obscureText: _obscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      iconData,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                        iconData = _obscureText
                            ? iconData = Icons.remove_red_eye
                            : Icons.visibility_off_outlined;
                      });
                    },
                  ),
                  controller: passwordController,
                  height: 'password',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icon(Icons.password,
                      color: Theme.of(context).colorScheme.primary),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    child: const Text(
                      'Forgot possword?',
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () {
                        setState(() {
                          checkErrors();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 16),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Wrap(
                    children: [
                      const Text(
                        "Don't have an account?",
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'Registeer');
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkErrors() async {
    focusNodeUser.requestFocus();
    focusNodePassword.requestFocus();
    if (formKey.currentState!.validate()) {
      var url = Uri.parse("https://reqres.in/api/login");
      var responde = await http.post(url,
          body: {"email": "eve.holt@reqres.in", "password": "cityslicka"},
          headers: {"Content-Type": "application/json"});
    }
  }
}
