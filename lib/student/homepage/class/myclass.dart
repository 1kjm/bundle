import 'package:bundle/student/classroom/classroom_student.dart';
import 'package:bundle/student/homepage/class/dummy_classes.dart';
import 'package:bundle/models/sizeconfig.dart';
import 'package:flutter/material.dart';

class MyClass extends StatefulWidget {
  @override
  _MyClassState createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MY Classes',
                style: TextStyle(fontSize: 36),
              ),
              const SizedBox(
                height: 20,
              ),
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
                        Container(
                          height: 300,
                          width: 300,
                          //edit this in the future
                          child: ListView.builder(
                            itemCount: DummyClass().classes.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: (context) => ClassRoomStudent(),
                                )),
                                title: Text('${DummyClass().classes[index]}'),
                              );
                            },
                          ),
                        )
                      ],
                    ))),
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: joinNewClass,
        child: const Icon(Icons.add_circle),
      ),
    );
  }

  final _formkey = GlobalKey<FormState>();
  void onCreateClassPressed() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
    }
  }

  void joinNewClass() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Color.fromRGBO(248, 248, 249, 1),
      context: context,
      builder: (context) {
        return SafeArea(
          top: true,
          child: Container(
            height: SizeConfig.screenHeight * 0.87,
            margin: EdgeInsets.all(5),

            // height: SizeConfig.screenHeight / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Text(
                    'Join Class',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
                Text(
                  'Enter Class id',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: _formkey,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.white,
                        elevation: 10,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                            onSaved: (newValue) {}, //possible editing
                            validator: (value) => value.length < 3
                                ? 'Require 3 characters'
                                : null,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      )),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () => onCreateClassPressed(),
                    child: Text(
                      'join Class',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
