import 'package:flutter/material.dart';


class RoundedBouton extends StatelessWidget {
  RoundedBouton(
      {required this.color, required this.title, required this.onPressed});

  final Color color;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Text(
        title,
        style:
        TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: color),
      ),
      onPressed: onPressed(),
      fillColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      constraints: BoxConstraints.tight(
        Size(300, 60),
      ),
    );
  }
}