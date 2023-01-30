import 'package:flutter/material.dart';

import 'icon_text.dart';

class MoreMenu extends StatelessWidget {
  final String title;

  MoreMenu(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Wrap(
        children: [
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              IconText('assets/images/kerjaan.png', 'Tugas'),
              SizedBox(
                height: 16,
              ),
              IconText('assets/images/absensi.png', 'Absensi'),
              SizedBox(
                height: 16,
              ),
              IconText('assets/images/tim.png', 'Tim'),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
