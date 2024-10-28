import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:talkly/core/constant/sign_in_method.dart';
import 'package:talkly/core/styles/button_custom_styles.dart';
import 'package:talkly/core/styles/text_field_styles.dart';
import 'package:talkly/core/utils/async_result.dart';
import 'package:talkly/core/utils/dialog_utils.dart';
import 'package:talkly/core/widgets/base.dart';
import 'package:talkly/core/widgets/talkly_button.dart';
import 'package:talkly/core/widgets/talkly_logo.dart';
import 'package:talkly/features/user/presentation/provider/auth_notifier.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController emaiController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final authState = ref.watch(authNotifierProvider);

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
                      controller: emaiController,
                      decoration: TextFieldStyles.decoration(
                        TextFormFieldDecoration(labelText: 'Email'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      decoration: TextFieldStyles.decoration(
                          TextFormFieldDecoration(labelText: 'Password')),
                    ),
                    TalklyButton(
                      margin: const EdgeInsets.only(top: 50),
                      style: ButtonCustomStyles.elevatedStyle(Colors.black),
                      loading: authState.signInStatus == TaskStatus.loading,
                      onPressed: () async {
                        await authNotifier.signIn(
                            method: SignInMethod.email,
                            email: emaiController.text,
                            password: passwordController.text);
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have account?"),
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
                      onPressed: () async {
                        // Google sign in
                        await authNotifier.signIn(method: SignInMethod.google);
                        if (ref.read(authNotifierProvider).signInStatus ==
                            TaskStatus.error) {
                          showDialogMessage(
                              // ignore: use_build_context_synchronously
                              context,
                              'Failed to sign in with google.');
                        }
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
