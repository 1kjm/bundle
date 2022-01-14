import 'dart:io';

import 'package:bundle/models/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AssignmentCreator extends StatefulWidget {
  @override
  _AssignmentCreatorState createState() => _AssignmentCreatorState();
}

class _AssignmentCreatorState extends State<AssignmentCreator> {
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Assignment'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(10),
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Material(
            elevation: 10,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Assignment Title')),
                Card(
                    child: Container(
                        margin: EdgeInsets.all(5),
                        child: TextFormField(
                          decoration: InputDecoration(border: InputBorder.none),
                        ))),
                SizedBox(
                  height: 15,
                ),
                Text('Assignment Description'),
                Card(
                    child: Container(
                        margin: EdgeInsets.all(5),
                        child: TextFormField(
                          decoration: InputDecoration(border: InputBorder.none),
                        ))),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Colors.blueGrey,
                      height: SizeConfig.screenHeight / 10,
                      width: SizeConfig.screenWidth / 2,
                      child: Image.asset(
                        'assets/icons/emptyimage.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Material(
                      elevation: 5,
                      child: IconButton(
                        icon: Icon(
                          Icons.camera,
                        ),
                        onPressed: () => _imageFromCamera(),
                      ),
                    ),
                    Material(
                      elevation: 5,
                      child: IconButton(
                        icon: Icon(
                          Icons.image,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Submit By'),
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text("${selectedDate.toLocal()}".split(' ')[0]),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  File imageFile;
  void _imageFromCamera() async {
    final picker = ImagePicker();
    PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    imageFile = File(pickedFile.path);
  }
}
