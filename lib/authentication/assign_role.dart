import 'package:bundle/student/homepage/homepage_student.dart';
import 'package:bundle/teacher/homepage/homepage_teacher.dart';
import 'package:bundle/models/sizeconfig.dart';
import 'package:flutter/material.dart';

class AssignRole extends StatefulWidget {
  @override
  _AssignRoleState createState() => _AssignRoleState();
}

class _AssignRoleState extends State<AssignRole> {
  static const List roles = ['TEACHER', 'STUDENT'];

  Future onContinuePressed() {
    return alertBoxWidget(groupValue);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/bundleappbar.png'),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 10,
                child: Column(
                  children: [
                    Card(
                      // margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: SizeConfig.screenHeight / 20,
                                width: SizeConfig.screenHeight / 20,
                                child: Image.asset(
                                  'assets/icons/superhero.png',
                                  fit: BoxFit.fill,
                                )),
                            Text('Who are You')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight / 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          groupValue = 0;
                        });
                      },
                      child: customCard(
                          radioValue: 0,
                          imageLocation: 'assets/icons/teacher.png',
                          text: 'Teacher'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          groupValue = 1;
                        });
                      },
                      child: customCard(
                          radioValue: 1,
                          imageLocation: 'assets/icons/classroom.png',
                          text: 'Student'),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight / 12,
              ),
              ElevatedButton(
                onPressed: () => onContinuePressed(),
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  int groupValue = 1;
  Widget customCard({String imageLocation, String text, int radioValue}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(value: radioValue, groupValue: groupValue, onChanged: null),
            Container(
                height: SizeConfig.screenHeight / 20,
                width: SizeConfig.screenHeight / 20,
                child: Image.asset(
                  imageLocation,
                  fit: BoxFit.fill,
                )),
            Text('$text')
          ],
        ),
      ),
    );
  }

  Future alertBoxWidget(int groupValue) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text('You Selected ${roles[groupValue]}'),
            content: Text(
              'Please note your role as a ${roles[groupValue]} permanent and cannot be changed',
            ),
            actions: [
              TextButton(
                child: Text("Continue"),
                onPressed: studentTeacherSelector,
              ),
              TextButton(
                child: Text("Go Back"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void studentTeacherSelector() {
    if (groupValue == 0) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomepageTeacher.routeName, (route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomepageStudent.routeName, (route) => false);
    }
  }
}
