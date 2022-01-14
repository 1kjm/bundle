import 'package:bundle/student/classroom/exam/exam_student.dart';
import 'package:bundle/student/classroom/notification_message.dart';
import 'package:bundle/models/sizeconfig.dart';
import 'package:flutter/material.dart';

class ClassRoomStudent extends StatelessWidget {
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
              NotificationMessageInsideStudentClassRoom(),
              SizedBox(
                height: 20,
              ),
              _customListTile(
                imageLocation: 'assets/icons/mobile-app.png',
                text: 'My Classes',
                cardColor: Color.fromRGBO(22, 206, 186, 1),
              ),
              _customListTile(
                imageLocation: 'assets/icons/stack.png',
                text: 'Study Materials',
                cardColor: Color.fromRGBO(0, 198, 255, 1),
              ),
              _customListTile(
                imageLocation: 'assets/icons/shift.png',
                text: 'My Attendance',
                cardColor: Color.fromRGBO(223, 135, 214, 1),
              ),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(ExamStudent.routeName),
                child: _customListTile(
                  imageLocation: 'assets/icons/test.png',
                  text: 'Exam',
                  cardColor: Color.fromRGBO(217, 117, 117, 1),
                ),
              ),
              _customListTile(
                imageLocation: 'assets/icons/exam.png',
                text: 'Assignments',
                cardColor: Color.fromRGBO(205, 200, 68, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customListTile(
      {@required String imageLocation,
      @required String text,
      @required Color cardColor}) {
    return Card(
        margin: EdgeInsets.all(15),
        color: cardColor,
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
                    height: SizeConfig.screenHeight * 0.1,
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
