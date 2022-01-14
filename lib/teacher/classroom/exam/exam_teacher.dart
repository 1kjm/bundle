import 'package:bundle/models/sizeconfig.dart';
import 'package:bundle/teacher/classroom/exam/active_exams_teacher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExamTeacher extends StatefulWidget {
  @override
  _ExamTeacherState createState() => _ExamTeacherState();
}

class _ExamTeacherState extends State<ExamTeacher>
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
              child: Image.asset('assets/icons/test.png'),
            ),
            Text('Exams')
          ],
        ),
        bottom: ColoredTabBar(
          color: Colors.green,
          tabBar: TabBar(
            indicatorColor: Colors.red,
            controller: _tabController,
            unselectedLabelColor: Colors.white,
            labelColor: Colors.amber,
            tabs: [
              Tab(icon: Icon(Icons.local_activity)),
              Tab(
                icon: Icon(Icons.bubble_chart),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        children: [
          ActiveExamsTeacher(),
          Text("This is chat Tab View"),
        ],
        controller: _tabController,
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
