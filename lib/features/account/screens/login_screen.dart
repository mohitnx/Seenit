import 'package:flutter/material.dart';
import 'package:seenit/common/widgets/custom_button.dart';
import 'package:seenit/features/home/home_screen.dart';
import 'package:seenit/theme.dart';

import '../../../common/widgets/custom_text_filed.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SeenIt',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Pallete.cyan),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomePage.routeName);
                    },
                    child: const Text('Browse Anynomously'),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
              ),
              Container(
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                    color: Pallete.greyColor,
                    border: Border.all(
                      color: Pallete.cyan,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    )),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomTextField(
                      hintText: 'Username or email',
                      bordercolor: Pallete.cyan,
                      maxLines: 1,
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      bordercolor: Pallete.cyan,
                      controller: passwordController,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomPrimaryButton(
                      onTap: () {},
                      text: 'Login',
                      color: Pallete.cyan,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
