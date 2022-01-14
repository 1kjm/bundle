import 'package:bundle/authentication/authentication_services/authentication.dart';
import 'package:bundle/models/user_model.dart';
import 'package:bundle/regulator.dart';
import 'package:bundle/student/classroom/exam/exam_student.dart';
import 'package:bundle/student/homepage/homepage_student.dart';
import 'package:bundle/teacher/homepage/homepage_teacher.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthenticationService().streamUser,
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Color.fromRGBO(51, 61, 121, 1),
            fontFamily: 'Signika',
            // appBarTheme: AppBarTheme(color: Color.fromRGBO(51, 61, 121, 1)),
            canvasColor: Color.fromRGBO(250, 230, 239, 1.0)),
        home: Regulator(),
        routes: {
          HomepageTeacher.routeName: (_) {
            return HomepageTeacher();
          },
          HomepageStudent.routeName: (_) {
            return HomepageStudent();
          },
          ExamStudent.routeName: (_) {
            return ExamStudent();
          }
        },
      ),
    );
  }
}
