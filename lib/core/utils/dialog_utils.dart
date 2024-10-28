import 'package:flutter/material.dart';
import 'package:talkly/core/styles/button_custom_styles.dart';
import 'package:talkly/core/widgets/talkly_button.dart';

void showDialogMessage(BuildContext context, String message) {
  showDialog(
    context: context,
    useSafeArea: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 30),
              child: Text(
                message,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            TalklyButton(
              style: ButtonCustomStyles.elevatedStyle(Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      );
    },
  );
}
