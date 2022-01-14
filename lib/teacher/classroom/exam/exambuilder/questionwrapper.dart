import 'package:bundle/models/sizeconfig.dart';
import 'package:bundle/teacher/classroom/exam/exambuilder/exambuilderbody.dart';
import 'package:flutter/material.dart';

class QuestionWrapper extends StatefulWidget {
  final optionCount;
  final examTitle;
  final examDescription;
  QuestionWrapper(
      {this.examDescription,
      @required this.examTitle,
      @required this.optionCount});
  @override
  _QuestionWrapperState createState() => _QuestionWrapperState();
}

class _QuestionWrapperState extends State<QuestionWrapper> {
  List<Widget> _questionsList = [];
  int questionNumberCounter = 0;

  void addQuestionClicked() {
    questionNumberCounter++;
    _questionsList = List.from(_questionsList)..add(questionBuilderWidget());
    setState(() {});
  }

  @override
  void initState() {
    _questionsList = [questionBuilderWidget()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Display QuestionNumber here'),
          actions: [TextButton(onPressed: null, child: Text('Save Exam'))],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: addQuestionClicked,
                  child: Text('Add Question'),
                ),
                Container(
                    height: SizeConfig.screenHeight * 0.8,
                    width: SizeConfig.screenWidth,
                    child: ListView(
                      children: _questionsList,
                    )),
              ],
            ),
          ),
        ));
  }

  Widget questionBuilderWidget() {
    return Material(
        child: ExamBuilderBody(
      questionNumberCounter: questionNumberCounter,
      optionCounter: widget.optionCount,
    ));
  }
}
