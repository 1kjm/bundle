import 'package:bundle/models/sizeconfig.dart';

import 'package:bundle/teacher/classroom/exam/exambuilder/questionwrapper.dart';
import 'package:flutter/material.dart';

class ActiveExamsTeacher extends StatefulWidget {
  @override
  _ActiveExamsTeacherState createState() => _ActiveExamsTeacherState();
}

class _ActiveExamsTeacherState extends State<ActiveExamsTeacher> {
  final _formKey = GlobalKey<FormState>();

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
        onPressed: () => createNewExam(context),
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

  void createNewExam(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Color.fromRGBO(248, 248, 249, 1),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              margin: EdgeInsets.all(5),
              height: SizeConfig.screenHeight * 0.85,
              width: SizeConfig.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: Text(
                      'Create New Exam',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.white,
                            elevation: 10,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: TextFormField(
                                onSaved: (newValue) {
                                  _examTitle = newValue;
                                }, //possible editing
                                validator: (value) => value.length < 3
                                    ? 'Require 3 characters'
                                    : null,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Exam Title'),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.white,
                            elevation: 10,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: TextFormField(
                                maxLines: null, minLines: 2,
                                onSaved: (newValue) {
                                  _examDescription = newValue;
                                }, //possible editing
                                validator: (value) => value.length < 3
                                    ? 'Require 3 characters'
                                    : null,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Exam Description'),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(child: Text('No of options')),
                              Expanded(
                                flex: 1,
                                child: Card(
                                    child: Container(
                                  child: Center(
                                    child: Text('$_optionsCounter'),
                                  ),
                                )),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      if (_optionsCounter < 7)
                                        setState(() {
                                          _optionsCounter++;
                                        });
                                    },
                                  )),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      if (_optionsCounter > 2)
                                        setState(() {
                                          _optionsCounter--;
                                        });
                                    }),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () => onCreateExamPressed(),
                      child: Text(
                        'Create Exam',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  int _optionsCounter = 2;
  var _examTitle = 'Empty';
  var _examDescription = 'Empty';
  void onCreateExamPressed() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => QuestionWrapper(
          examTitle: _examTitle,
          optionCount: _optionsCounter,
          examDescription: _examDescription,
        ),
      ));
    }
  }
}
