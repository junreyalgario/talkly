import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:talkly/core/styles/button_custom_styles.dart';
import 'package:talkly/core/styles/text_field_styles.dart';
import 'package:talkly/core/widgets/base.dart';
import 'package:talkly/core/widgets/talkly_button.dart';
import 'package:talkly/core/widgets/talkly_logo.dart';
import 'package:talkly/features/user/data/sources/google_auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: const TalklyLogo(),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 50),
                width: 300,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: TextFieldStyles.decoration(
                          TextFormFieldDecoration(labelText: 'Email')),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: TextFieldStyles.decoration(
                          TextFormFieldDecoration(labelText: 'Password')),
                    ),
                    TalklyButton(
                      margin: const EdgeInsets.only(top: 50),
                      style: ButtonCustomStyles.elevatedStyle(Colors.black),
                      onPressed: () {},
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Dont have account?'),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Create new account.',
                            style: TextStyle(color: Colors.green),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        'Or',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                      ),
                    ),
                    TalklyButton(
                      margin: const EdgeInsets.only(top: 20),
                      style: ButtonCustomStyles.elevatedStyle(Colors.lightBlue),
                      faIcon: const FaIcon(
                          color: Colors.white, FontAwesomeIcons.google),
                      onPressed: () {
                        GoogleAuthService auth = GoogleAuthService();
                        auth.signIn();
                      },
                      child: const Text(
                        'Sign-in using Google',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TalklyButton(
                      margin: const EdgeInsets.only(top: 20),
                      style: ButtonCustomStyles.elevatedStyle(Colors.blue),
                      faIcon: const FaIcon(
                          color: Colors.white, FontAwesomeIcons.facebook),
                      onPressed: () {},
                      child: const Text(
                        'Sign-in using Facebook',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
