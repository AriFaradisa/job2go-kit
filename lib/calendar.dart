import 'package:flutter/material.dart';

class CalendarCustom extends StatefulWidget {
  const CalendarCustom({Key? key}) : super(key: key);

  @override
  _CalendarCustomState createState() => _CalendarCustomState();
}

class _CalendarCustomState extends State<CalendarCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.chevron_left),
              Expanded(
                  child: Text(
                "Agustus 2021",
                textAlign: TextAlign.center,
              )),
              Icon(Icons.chevron_right)
            ],
          ),
        ],
      ),
    );
  }
}
