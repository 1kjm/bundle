import 'package:bundle/teacher/classroom/assignments/assignments_home.dart';
import 'package:bundle/teacher/classroom/exam/exam_teacher.dart';
import 'package:bundle/teacher/classroom/notification_message.dart';
import 'package:bundle/models/sizeconfig.dart';
import 'package:flutter/material.dart';

class ClassRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('classroom'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                child: Text('classID:Kt101'),
                alignment: AlignmentDirectional.topStart,
              ),
              NotificationMessageInsideTeacherClassRoom(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _customGridTile(
                      cardColor: Color.fromRGBO(22, 206, 186, 1),
                      imageLocation: 'assets/icons/mobile-app.png',
                      text: 'Live'),
                  _customGridTile(
                      cardColor: Color.fromRGBO(0, 198, 255, 1),
                      imageLocation: 'assets/icons/student.png',
                      text: 'Student')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ExamTeacher(),
                    )),
                    child: _customGridTile(
                        cardColor: Color.fromRGBO(217, 117, 117, 1),
                        imageLocation: 'assets/icons/test.png',
                        text: 'Exam'),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AssignmentHome(),
                    )),
                    child: _customGridTile(
                        cardColor: Color.fromRGBO(205, 200, 68, 1),
                        imageLocation: 'assets/icons/exam.png',
                        text: 'Assignments'),
                  )
                ],
              ),
              _customListTile(
                  imageLocation: 'assets/icons/stack.png',
                  text: 'Study Materials'),
              _customListTile(
                  imageLocation: 'assets/icons/shift.png', text: 'Attendance'),
              _customListTile(
                  imageLocation: 'assets/icons/transaction-history.png',
                  text: 'User Log'),
              _customListTile(
                  imageLocation: 'assets/icons/gear.png',
                  text: 'Manage My Class'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customGridTile(
      {@required String text,
      @required String imageLocation,
      @required Color cardColor}) {
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: SizeConfig.screenHeight * 0.19,
        width: SizeConfig.screenWidth * 0.45,
        padding: EdgeInsets.all(10),
        child: Center(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    '$imageLocation',
                    fit: BoxFit.fill,
                  ),
                ),
                Text('$text'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customListTile(
      {@required String imageLocation, @required String text}) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          width: SizeConfig.screenWidth * 0.9,
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: SizeConfig.screenHeight * 0.08,
                    width: SizeConfig.screenWidth * 0.1,
                    child: Image.asset('$imageLocation'),
                  ),
                ),
                Expanded(flex: 1, child: Text('$text')),
              ],
            ),
          ),
        ));
  }
}
