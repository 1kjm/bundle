import 'package:bundle/student/homepage/class/myclass.dart';
import 'package:bundle/student/homepage/drawerbody.dart';
import 'package:bundle/student/homepage/feeds/myfeed.dart';

import 'package:flutter/material.dart';

class HomepageStudent extends StatefulWidget {
  static const routeName = '/HomePage_student';
  @override
  _HomepageStudentState createState() => _HomepageStudentState();
}

class _HomepageStudentState extends State<HomepageStudent> {
  var _selectedIndex = 0;
  void onBottomNavigationBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> screenchanger = [MyFeeds(), MyClass()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset('assets/bundleappbar.png'),
          actions: [IconButton(icon: Icon(Icons.message), onPressed: null)],
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerHeader(
                    child: Row(
                  children: [Text('Student')],
                )),
                DrawerBody(),
              ],
            ),
          ),
        ),
        body: screenchanger[_selectedIndex],
        bottomNavigationBar: customBottomNavBar(),
      ),
    );
  }

  Widget customBottomNavBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
      child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Theme.of(context).primaryColor,
          // elevation: 5,
          onTap: onBottomNavigationBarItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.class_), label: 'feed'),
            BottomNavigationBarItem(
                icon: const Icon(Icons.school), label: 'My Class')
          ]),
    );
  }
}
