import 'package:flutter/material.dart';


class CalendarDates extends StatelessWidget {
  final String days;
  final String dates;
  final Color dayClr;
  final Color dateClr;

  CalendarDates({this.days, this.dates, this.dayClr, this.dateClr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            days,
            style: TextStyle(
                fontSize: 16, color: dayClr, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 10.0),
          Text(
            dates,
            style: TextStyle(
                fontSize: 16, color: dateClr, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}