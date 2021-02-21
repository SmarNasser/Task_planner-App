import 'package:flutter/material.dart';
class Tasks extends StatelessWidget {
  final String title;
  final String taskContent;
  final Color boxClr;
  final Color txtClr;
  final Color contentClr;
  Tasks({this.title,this.taskContent,this.boxClr,this.txtClr,this.contentClr});
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: boxClr,
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              taskContent,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white70,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
