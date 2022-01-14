import 'package:bundle/teacher/classroom/assignments/assignment_creator.dart';
import 'package:flutter/material.dart';

class ActiveAssignmentsTeacher extends StatefulWidget {
  @override
  _ActiveExamsTeacherState createState() => _ActiveExamsTeacherState();
}

class _ActiveExamsTeacherState extends State<ActiveAssignmentsTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(7),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10,
              child: Column(
                children: [customListTile(), customListTile()],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AssignmentCreator(),
        )),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget customListTile() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        child: ListTile(
          title: Text('hello'),
        ),
      ),
    );
  }
}
