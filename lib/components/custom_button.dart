import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  CustomButton({@required this.child,@required this.onPressed});

  final IconData child;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:onPressed,
      child: Icon(child),
      elevation: 6.0,
      shape: CircleBorder() ,
      fillColor:Color(0xFF4c4F5E) ,
      constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ),

    );
  }
}