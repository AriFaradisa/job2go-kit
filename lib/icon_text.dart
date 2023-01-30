import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final String icon;
  final String text;

  IconText(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 32,
          width: 32,
          child: Image.asset(
            icon,
            color: Colors.red,
          ),
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
