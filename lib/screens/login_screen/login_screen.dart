// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../resources/widget/custom_text_field.dart';

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
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Image.asset(
                    'assets/images/Welcome.jpg',
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: 2000,
                    fit: BoxFit.fill,
                  ),
                ),
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
                      Icons.remove_red_eye,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
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
                    child: const Text('Forgot possword?',),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () {
                        setState(() {
                          if (formKey.currentState!.validate()) {}
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
