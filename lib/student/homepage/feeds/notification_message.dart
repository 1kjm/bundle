import 'package:flutter/material.dart';

class NotificationMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_outline),
              Text('You Have Five Tasks Pending')
            ],
          ),
        ),
      ),
    );
  }
}
