import 'package:flutter/material.dart';
import 'package:taskplanner/dates/list_dates.dart';
import 'package:taskplanner/widgets/tasks.dart';
import 'add_new_task_page.dart';
import 'home_page.dart';
import 'package:taskplanner/colors/light_colors.dart';
import 'package:taskplanner/dates/week_column.dart';
import 'package:taskplanner/widgets/top_container_appbar.dart';
class TasksPage extends StatefulWidget {

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  Widget _dashedText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '-----------------------------',
        maxLines: 1,
        style:
        TextStyle(fontSize: 20.0, color: light? Colors.black26:Colors.white70, letterSpacing: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor:light? LightColors.kLightYellow:LightColors.kDarkBlue,
        body: SafeArea(
          child:Column(
            children: <Widget>[
              TopContainerAppbar(
                height: 300,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios,),
                        onPressed:(){
                          Navigator.pop(context);
                        },
                     iconSize: 25.0,
                      color: Colors.white ,
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Today',style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.w700,color: Colors.white
                        ),),
                       Container(
                         height: 40.0,
                         width: 120.0,
                         decoration: BoxDecoration(
                           color:LightColors.kDarkYellow,
                           borderRadius: BorderRadius.circular(30),
                         ),
                         child: FlatButton(
                         onPressed: (){
                           Navigator.push(context,
                               MaterialPageRoute(
                                   builder: (context)=>AddNewTask()));
                           },
                             child: Text('Add Task',
                               style: TextStyle(
                                   //color: Colors.white,
                                   fontWeight: FontWeight.w700,
                                   fontSize: 16),
                             ),

                         ),
                       )
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Productive Day, Smar',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'June, 2020'.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,color: Colors.white70),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 58.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: days.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CalendarDates(
                            days: days[index],
                            dates: dates[index],
                            dayClr: index == 5 ? Colors.orangeAccent : Colors.white60,
                            dateClr: index == 5 ? Colors.orangeAccent : Colors.white,
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: ListView.builder(
                          itemCount: time.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                                padding:const EdgeInsets.symmetric(vertical: 20.0,),
                                child: Text(
                                  '${time[index]} ${time[index] > 8 ? 'PM' : 'AM'}',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color:light? Colors.black87:Colors.white70,
                                  ),
                                ),
                              ),
                        ),
                      ),

                      Expanded(
                        flex: 5,
                          child:ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              _dashedText(),
                              Tasks(
                                title: 'Project Research',
                                taskContent:
                                'Discuss with the colleagues about the future plan',
                                boxClr: LightColors.kBlueOcean,
                              ),
                              _dashedText(),
                              Tasks(
                                title: 'Work on Medical App',
                                taskContent: 'Add medicine tab',
                                boxClr: LightColors.kPink,

                              ),
                              _dashedText(),
                              Tasks(
                                title: 'Call',
                                taskContent: 'Call to david',
                                boxClr: LightColors.kAmber,

                              ),
                              _dashedText(),
                              Tasks(
                                title: 'Design Meeting',
                                taskContent:
                                'Discuss with designers for new task for the medical app',
                                boxClr: LightColors.kLightPurple,
                              ),
                            ],
                          ) ),
                    ],
                  ),
                ),
              ))
            ],
          ), ),
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    @required this.txt,
    @required this.onPressed,
    this.width,this.height,
    this.clr
  });
  final Function onPressed;
  final Text txt;
  final double width,height;
  final Color clr;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 10.0,
      child: txt,
      constraints: BoxConstraints.expand(
        width: width,
        height: height,
      ),
      shape: CircleBorder(),
      fillColor: clr,
    );
  }
}
