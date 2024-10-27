import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
    );
    // return GestureDetector(
    //   onTap: () {
    //     FocusScope.of(context).unfocus();
    //   },
    //   child: Scaffold(
    //     body: SafeArea(child: child),
    //   ),
    // );
  }
}
