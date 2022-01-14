import 'package:flutter/material.dart';

class ExamBuilderHomeDesigns {
  Widget examBuilderHints() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Container(
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info),
              Text('You can add a Maximum of 6 Options')
            ],
          ),
        ),
      ),
    );
  }
}
