import 'package:flutter/material.dart';
import '../const/constants.dart';
class ReusableCardContent extends StatelessWidget {
  ReusableCardContent( this.icon, this.text);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style:kLabelTextStyle,
        )
      ],
    );
  }
}