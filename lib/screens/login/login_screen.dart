// ignore_for_file: unused_field, avoid_print

import 'dart:convert';

import 'package:delivery/resources/http.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

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
                        setState(() async {
                          bool result =
                              await InternetConnectionChecker().hasConnection;
                          if (result == true) {
                            print('YAY! Free cute dog pics!');
                            await signIn();
                          } else {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  scrollable: true,
                                  title: const Text('No internet :( Reason:'),
                                  content: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 16),
                                      Icon(
                                        Icons.wifi_off,
                                        size: 50,
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
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

  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      var url = Uri.parse(Http.LOGIN_METHOD);
      var response = await http.post(url,
          body: jsonEncode({
            "email": userController.text,
            "password": passwordController.text
          }),
          headers: {"Content-Type": "application/json"});
      print('Response status: ${response.statusCode}');
      print('ll');
      print('Response body: ${response.body}');
    }
  }

  Future<void> checkErrors() async {
    focusNodeUser.requestFocus();
    focusNodePassword.requestFocus();
  }
}
