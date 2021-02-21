import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskplanner/screens/home_page.dart';
import 'colors/light_colors.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      title: 'Task Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: LightColors.kDarkBlue,
            displayColor: LightColors.kDarkBlue,
            fontFamily: 'Poppins'
        ),
      ),
      home:  Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

