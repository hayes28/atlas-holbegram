// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:holbegram/screens/signup_screen.dart';
import 'package:holbegram/widgets/text_field.dart';

//ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  bool passwordVisible;

  LoginScreen({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.passwordVisible,
  });

  get usernameController => null;

  get passwordConfirmController => null;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  get loadingBuilder => null;

  @override
  // Dispose only the TextEditingController arguments
  void dispose() {
    widget.emailController.dispose();
    widget.passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 28,
        ),
        const Text(
          'Holbegram',
          style: TextStyle(
            fontFamily: "Billabong",
            fontSize: 50,
          ),
        ),
        const Image(
          image: AssetImage('images/logo.webp'),
          width: 80,
          height: 60,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 28,
                ),
                const SizedBox(
                  height: 28,
                ),
                TextFieldInput(
                    controller: widget.emailController,
                    ispassword: false,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  controller: widget.passwordController,
                  ispassword: !widget.passwordVisible,
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    alignment: Alignment.bottomLeft,
                    icon: widget.passwordVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        widget.passwordVisible = !widget.passwordVisible;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(218, 226, 37, 24),
                        )),
                        onPressed: () {},
                        child: const Text('Log In',
                            style: TextStyle(
                              color: Colors.white,
                            )))),
                const SizedBox(height: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Forgot Your Login Details? '),
                    Text(
                      'Get Help Logging In',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Flexible(
                  flex: 0,
                  child: Container(),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't Have an Account",
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp(
                                        emailController: widget.emailController,
                                        usernameController:
                                            widget.usernameController,
                                        passwordController:
                                            widget.passwordController,
                                        passwordConfirmController:
                                            widget.passwordConfirmController,
                                      )),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(218, 226, 37, 24),
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Flexible(
                        child: Divider(
                      thickness: 2,
                    )),
                    Text(' OR '),
                    Flexible(
                        child: Divider(
                      thickness: 2,
                    ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Image.asset('images/google-logo.png',
                      width: 40,
                      height: 40,
                    ),
                const Text(" Sign in with Google"),
              ],
            )
          ],
        ))
      ],
    )));
  }
}