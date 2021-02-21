import 'package:flutter/material.dart';
import 'package:taskplanner/screens/home_page.dart';

class TxtField extends StatelessWidget {
  final String label;
  final int maxLines;
  final int minLines;
  final Icon icon;
  final Color titleClr;

  TxtField({this.label,this.titleClr, this.maxLines = 1, this.minLines = 1, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(

      style: TextStyle(color: titleClr,fontSize: 16.0),
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
          suffixIcon: icon == null ? null: icon,
          labelText: label,
          labelStyle: TextStyle(color: titleClr),


          focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color:light?Colors.black54:Colors.white)),
          border:
          UnderlineInputBorder(borderSide: BorderSide(color: light?Colors.grey:Colors.white))),
    );
  }
}
