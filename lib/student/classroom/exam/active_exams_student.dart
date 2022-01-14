import 'package:bundle/student/classroom/exam/examviewer/examIntro.dart';
import 'package:flutter/material.dart';

class ActiveExamsStudent extends StatefulWidget {
  @override
  _ActiveExamsState createState() => _ActiveExamsState();
}

class _ActiveExamsState extends State<ActiveExamsStudent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            child: Column(
              children: [customListTile(), customListTile()],
            ),
          )
        ],
      ),
    );
  }

  Widget customListTile() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        child: ListTile(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ExamIntro(),
          )),
          title: Text('hello'),
        ),
      ),
    );
  }
}
