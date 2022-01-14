import 'package:bundle/models/sizeconfig.dart';
import 'package:bundle/teacher/classroom/assignments/active_assignments.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AssignmentHome extends StatefulWidget {
  @override
  _AssignmentHomeState createState() => _AssignmentHomeState();
}

class _AssignmentHomeState extends State<AssignmentHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset('assets/icons/exam.png'),
            ),
            Text('Assignments')
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            width: SizeConfig.screenWidth,
            child: ColoredTabBar(
              color: Colors.amber,
              tabBar: TabBar(
                indicatorColor: Colors.red,
                controller: _tabController,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.red,
                tabs: [
                  Tab(icon: Icon(Icons.local_activity)),
                  Tab(
                    icon: Icon(Icons.bubble_chart),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: SizeConfig.screenHeight * 0.75,
            width: SizeConfig.screenWidth,
            child: TabBarView(
              children: [
                ActiveAssignmentsTeacher(),
                Text("This is chat Tab View"),
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}

class ColoredTabBar extends Card implements PreferredSizeWidget {
  ColoredTabBar({this.color, this.tabBar});

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: color,
        child: tabBar,
      );
}
