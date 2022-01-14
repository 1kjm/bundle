import 'package:flutter/material.dart';

class ExamBody extends StatefulWidget {
  @override
  _ExamBodyState createState() => _ExamBodyState();
}

class _ExamBodyState extends State<ExamBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: Container(),
            //Same appbar for two occassions
            title: const Text('ExamBody')),
        body: Container(child: Text('Exam')),
      ),
    );
  }
}
