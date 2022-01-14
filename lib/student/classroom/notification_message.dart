import 'package:bundle/models/sizeconfig.dart';
import 'package:flutter/material.dart';

class NotificationMessageInsideStudentClassRoom extends StatefulWidget {
  @override
  _NotificationMessageInsideStudentClassRoomState createState() =>
      _NotificationMessageInsideStudentClassRoomState();
}

class _NotificationMessageInsideStudentClassRoomState
    extends State<NotificationMessageInsideStudentClassRoom> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Container(
        width: SizeConfig.screenWidth * 0.95,
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.timelapse), Text('You Have 5 Messages')],
          ),
        ),
      ),
    );
  }
}
