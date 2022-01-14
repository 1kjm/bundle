import 'package:bundle/student/classroom/exam/examviewer/exam_body.dart';
import 'package:flutter/material.dart';

class ExamIntro extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text('Exam Instructions')),
          body: Container(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(children: <Widget>[Text('instructions')]),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ElevatedButton(
                    child: Text(
                      'Begin Exam',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ExamBody(),
                      ));
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
