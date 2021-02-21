import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskplanner/colors/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:taskplanner/screens/tasks_page.dart';
import 'package:taskplanner/widgets/active_projects.dart';
import 'package:taskplanner/widgets/task_column.dart';
import 'package:taskplanner/widgets/top_container_appbar.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

bool light = true;

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: LightColors.kLightPurple));
  }

  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: light ? LightColors.kDarkBlue : Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: light ? lightTheme : darkTheme,
      home: Scaffold(
        backgroundColor:
            light ? LightColors.kLightYellow : LightColors.kDarkBlue,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              TopContainerAppbar(
                height: 200,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Switch(
                            value: light,
                            activeColor: LightColors.kAmber,
                            activeThumbImage: NetworkImage(
                                'https://simpleicon.com/wp-content/uploads/sun.png'),
                            inactiveThumbImage: NetworkImage(
                                'https://c7.uihere.com/files/350/613/281/computer-icons-desktop-wallpaper-moon-free-moon-svg.jpg'),
                            onChanged: (state) {
                              setState(() {
                                light = state;
                              });
                            }),
                        //IconButton(Icons.menu,color: Color(0xFFFFFCF9), size: 30.0),
                        Icon(Icons.menu, color: Color(0xFFFFFCF9), size: 30.0),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0.75,
                            progressColor: LightColors.kRed,
                            backgroundColor: LightColors.kLightPurple,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: CircleAvatar(
                              backgroundColor: LightColors.kBlue,
                              radius: 35.0,
                              backgroundImage: AssetImage(
                                'images/female.png',
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Smar Abo-Elsoud',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Color(0xFFFFFCF9),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Flutter Developer',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: LightColors.kLightYellow,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
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
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                subheading('My Tasks'),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: LightColors.kBlueOcean,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TasksPage()),
                                      );
                                    },
                                    iconSize: 30.0,
                                    tooltip: 'Show Calender',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.0),
                            TaskColumn(
                              icon: Icons.alarm,
                              iconBackgroundColor: LightColors.kRed,
                              title: 'To Do',
                              subtitle: '5 tasks now. 1 started',
                            ),
                            SizedBox(height: 15.0),
                            TaskColumn(
                              icon: Icons.blur_circular,
                              iconBackgroundColor: LightColors.kDarkYellow,
                              title: 'In Progress',
                              subtitle: '1 tasks now. 1 started',
                            ),
                            SizedBox(height: 15.0),
                            TaskColumn(
                              icon: Icons.check_circle_outline,
                              iconBackgroundColor: LightColors.kGreen,
                              title: 'Done',
                              subtitle: '18 tasks now. 13 started',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            subheading('Active Projects'),
                            SizedBox(height: 5.0),
                            Row(
                              children: <Widget>[
                                ActiveProjects(
                                  cardColor: LightColors.kPink,
                                  percent: 0.25,
                                  title: "Medical App",
                                  subtitle: '9 hours progress',
                                ),
                                SizedBox(width: 20.0),
                                ActiveProjects(
                                  cardColor: LightColors.kAmber,
                                  percent: 0.6,
                                  title: 'Making History Notes',
                                  subtitle: '20 hours progress',
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                ActiveProjects(
                                  cardColor: LightColors.kBlueOcean,
                                  percent: 0.45,
                                  title: 'Sports App',
                                  subtitle: '5 hours progress',
                                ),
                                SizedBox(width: 20.0),
                                ActiveProjects(
                                  cardColor: LightColors.kLightPurple,
                                  percent: 0.9,
                                  title: 'Online Flutter Course',
                                  subtitle: '23 hours progress',
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
            ],
          ),
        ),
      ),
    );
  }
}
