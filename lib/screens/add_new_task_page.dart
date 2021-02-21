import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskplanner/colors/light_colors.dart';
import 'package:taskplanner/widgets/add_task_txt_feild.dart';
import 'package:taskplanner/widgets/top_container_appbar.dart';

import 'home_page.dart';
String startTime='Pick Start Time',datePic='Pick a Date',endTime='Pick End Time';
class AddNewTask extends StatefulWidget {
  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:
      light ? LightColors.kLightYellow : LightColors.kDarkBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: <Widget>[
              TopContainerAppbar(
                width: width,
                padding: EdgeInsets.fromLTRB(20, 20, 20,30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios,),
                      onPressed:(){
                        Navigator.pop(context);
                      },
                      iconSize: 25.0,
                      color: Colors.white ,
                    ),
                    SizedBox(height: 30,),
                    Text(
                      'Add new task',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w700, color: Colors.white ,),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TxtField(label: 'Title',titleClr: Colors.white,),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 40.0,
                                  width: 350.0,
                                  decoration: BoxDecoration(
                                    color:LightColors.kPalePink,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: FlatButton(
                                    onPressed: (){

                                      setState(() {
                                        DateTime now=DateTime.now();
                                        showDatePicker(context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2020),
                                          lastDate: DateTime(2030),
                                          builder: (BuildContext context, Widget child) {
                                            return Theme(
                                              data: ThemeData.dark().copyWith(
                                                colorScheme: ColorScheme.light(
                                                ),
                                                dialogBackgroundColor:LightColors.kDarkBlue,
                                                accentColor: LightColors.kLightPurple,
                                                primaryColorDark: LightColors.kRed,
                                              ),
                                              child: child,
                                            );
                                          },
                                        ).then((DateTime value)
                                        {
                                          datePic='Task Date '+'( '+value.day.toString()+'-'+value.month.toString()+'-'+value.year.toString()+' )';
                                        });
                                      });

                                    },
                                    child: Text('$datePic',
                                      style: TextStyle(
                                        color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(

                              decoration: BoxDecoration(
                                color:LightColors.kAmber,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: FlatButton(
                                onPressed: (){

                                  setState(() {
                                    DateTime now=DateTime.now();
                                    showTimePicker(context: context,
                                        builder: (BuildContext context, Widget child) {
                                          return Theme(
                                            data: ThemeData.dark().copyWith(
                                              colorScheme: ColorScheme.light(
                                              ),
                                              dialogBackgroundColor:LightColors.kDarkBlue,
                                              accentColor: LightColors.kLightPurple,
                                              primaryColorDark: LightColors.kRed,
                                            ),
                                            child: child,
                                          );
                                        },
                                      initialTime: TimeOfDay(hour: now.hour, minute: now.minute)
                                    ).then((TimeOfDay value)
                                    {
                                      startTime='Start Time '+value.hour.toString()+' : '+value.minute.toString();
                                    });
                                  });

                                },
                                child: Text('$startTime',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: Container(

                              decoration: BoxDecoration(
                                color:LightColors.kRed,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: FlatButton(
                                onPressed: (){

                                  setState(() {
                                    DateTime now=DateTime.now();
                                    showTimePicker(context: context,
                                        builder: (BuildContext context, Widget child) {
                                          return Theme(
                                            data: ThemeData.dark().copyWith(
                                              colorScheme: ColorScheme.light(
                                              ),
                                              dialogBackgroundColor:LightColors.kDarkBlue,
                                              accentColor: LightColors.kLightPurple,
                                              primaryColorDark: LightColors.kRed,
                                            ),
                                            child: child,
                                          );
                                        },
                                        initialTime: TimeOfDay(hour: now.hour, minute: now.minute)
                                    ).then((TimeOfDay value)
                                    {
                                      endTime='End Time '+value.hour.toString()+' : '+value.minute.toString();
                                    });
                                  });

                                },
                                child: Text('$endTime',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                      SizedBox(height: 20),
                      TxtField(
                        label: 'Description',
                        minLines: 3,
                        maxLines: 3,
                        titleClr: light?Colors.black54:Colors.white ,

                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 18,
                                color: light?Colors.black54:Colors.white ,
                              ),
                            ),
                            SizedBox(height: 10),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              alignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              runSpacing: 0,
                              spacing: 10.0,
                              children: <Widget>[
                                Chip(
                                  label: Text("SPORT APP"),
                                  backgroundColor: LightColors.kBlueOcean,
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                                Chip(
                                  label: Text("MEDICAL APP"),
                                ),
                                Chip(
                                  label: Text("RENT APP"),
                                ),
                                Chip(
                                  label: Text("NOTES"),
                                ),
                                Chip(
                                  label: Text("GAMING PLATFORM APP"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                width: width-40,
                decoration: BoxDecoration(
                  color:LightColors.kDarkYellow,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: FlatButton(
                  onPressed: (){
                    showDialog<String>(context: context,
                        builder: (BuildContext context)=>
                            AlertDialog(
                              title: const Text('Done'),
                              content: Text('Your Task is Created'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('OK'),
                                  onPressed: ()=>Navigator.pop(context,'OK'),
                                ),
                                FlatButton(
                                  child: Text('Cancel'),
                                  onPressed: ()=>Navigator.pop(context,'Cancel'),
                                ),
                              ],
                            )
                    );
                  },
                  child: Text('Add Task',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
