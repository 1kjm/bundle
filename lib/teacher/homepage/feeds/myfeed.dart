import 'package:bundle/teacher/homepage/feeds/notification_message.dart';
import 'package:bundle/models/sizeconfig.dart';
import 'package:flutter/material.dart';

class MyFeeds extends StatefulWidget {
  @override
  _MyFeedsState createState() => _MyFeedsState();
}

class _MyFeedsState extends State<MyFeeds> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: NotificationMessage()),
            const SizedBox(height: 20),
            const Text(
              'MY Feed',
              style: TextStyle(fontSize: 36),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                  height: SizeConfig.screenHeight / 2,
                  width: SizeConfig.screenWidth,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.timelapse),
                      const Text('Coming Soon'),
                    ],
                  ))),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
