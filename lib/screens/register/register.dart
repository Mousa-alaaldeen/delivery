// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import '../../resources/widget/custom_text_field.dart';

/// Flutter code sample for [ScaleTransition].

class RegisteerScreen extends StatefulWidget {
  const RegisteerScreen({super.key});

  @override
  State<RegisteerScreen> createState() => _RegisteerScreenState();
}

class _RegisteerScreenState extends State<RegisteerScreen>
    with TickerProviderStateMixin {
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  FocusNode focusNodeUser = FocusNode();
  final String _errorTextUser = '';
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: IconButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, 'Login');
                          },
                          icon: const Icon(
                            Icons.navigate_before,
                          )),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                const Center(
                  child: Text(
                    'Create your new account',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your user name ';
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
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your email';
                    }
                    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                        .hasMatch(value)) {
                      return 'Email is invalid';
                    }
                    return null; // لا يوجد خطأ
                  },
                  controller: emailController,
                  height: 'email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                CustomTextField(
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your Passwords ';
                    }
                    if (value.toString().length < 8) {
                      return 'Passwords length greater or equal to 8';
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
                  maxLength: 15,
                  height: 'password',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icon(Icons.password,
                      color: Theme.of(context).colorScheme.primary),
                ),
                CustomTextField(
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your Confirm Passwords ';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  obscureText: true,
                  controller: confirmPasswordController,
                  height: 'Confirm password',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icon(Icons.password,
                      color: Theme.of(context).colorScheme.primary),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () {
                        setState(() {
                          focusNodeUser.requestFocus();
                          focusNodePassword.requestFocus();
                          if (formKey.currentState!.validate()) {}
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Sing up',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 16),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
