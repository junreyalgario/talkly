import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TalklyButton extends StatelessWidget {
  final double height;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onPressed;
  final Widget child;
  final ButtonStyle? style;
  final FaIcon? faIcon;

  const TalklyButton({
    super.key,
    this.height = 50,
    this.margin,
    required this.onPressed,
    required this.child,
    this.style,
    this.faIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            faIcon ?? Container(),
            SizedBox(width: faIcon != null ? 8 : 0),
            child,
          ],
        ),
      ),
    );
  }
}
