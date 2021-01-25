import 'package:flutter/material.dart';

class CustomDailyGoals extends StatelessWidget {
  final String day;
  final double value;

  CustomDailyGoals({this.day, this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.clip,
      children: <Widget>[
        Container(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 1,
            backgroundColor: Color(0xFFB0CEE8),
            value: value,
            valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFFE77834)),
          ),
        ),
        Container(
          height: 20,
          width: 20,
          alignment: Alignment.center,
          child: Text(
            "$day",
            style: TextStyle(
                color: Color(0xFFB0CEE8),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
