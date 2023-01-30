import 'package:flutter/material.dart';

class InfoLabel extends StatelessWidget {
  final Function onTap;
  final String status;

  const InfoLabel({required this.onTap, required this.status}) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 18,
        width: 18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: status == "PENDING" ? Colors.blue : Colors.red[300],
            borderRadius: BorderRadius.circular(100)),
        child: Text("i",
            style: TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
