import 'package:flutter/material.dart';

class TalklyLogo extends StatelessWidget {
  const TalklyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 70,
          child: Text(
            'TALKLY',
            style: TextStyle(
                fontSize: 60.0,
                fontWeight: FontWeight.w900,
                color: Colors.black),
          ),
        ),
        SizedBox(
          height: 30,
          child: Text(
            'Your Gateway to English Fluency!',
            style: TextStyle(
                fontSize: 11.0,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
