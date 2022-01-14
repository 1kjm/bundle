import 'package:bundle/models/sizeconfig.dart';
import 'package:bundle/teacher/classroom/exam/exambuilder/exambuilder_home_designs.dart';
import 'package:flutter/material.dart';

class ExamBuilderBody extends StatefulWidget {
  final int optionCounter;
  final int questionNumberCounter;
  ExamBuilderBody({@required this.optionCounter, this.questionNumberCounter});
  @override
  _ExamBuilderBodyState createState() => _ExamBuilderBodyState();
}

class _ExamBuilderBodyState extends State<ExamBuilderBody> {
  List<Widget> _options = List.generate(6, (index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      elevation: 10,
      child: Container(
        height: SizeConfig.screenHeight / 15,
        width: SizeConfig.screenWidth / 2,
        margin: EdgeInsets.all(10),
        child: TextFormField(
          maxLines: null,
          minLines: 2,
          validator: (value) =>
              value.length < 3 ? 'Require 3 characters' : null,
          decoration:
              InputDecoration(border: InputBorder.none, labelText: 'Options'),
        ),
      ),
    );
  });

  int _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    print(widget.questionNumberCounter);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            ExamBuilderHomeDesigns().examBuilderHints(),
            SizedBox(
              height: 10,
            ),
            Text('Question Number here'),
            customQuestionCard(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: SizeConfig.screenHeight / 7,
                  width: SizeConfig.screenWidth / 2,
                  child: Image.asset('assets/icons/emptyimage.png'),
                ),
                Material(
                  elevation: 5,
                  child: IconButton(
                    icon: Icon(
                      Icons.camera,
                    ),
                    onPressed: () {},
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
            Container(
              height: SizeConfig.screenHeight / 2,
              width: SizeConfig.screenWidth * 0.9,
              child: ListView.builder(
                itemCount: widget.optionCounter,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _options[index],
                      Radio(
                          value: index,
                          groupValue: _groupValue,
                          onChanged: (value) => {
                                setState(() {
                                  _groupValue = value;
                                }),
                                print(
                                    '${widget.questionNumberCounter}$_groupValue'),
                              }),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customQuestionCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      elevation: 10,
      child: Container(
        margin: EdgeInsets.all(10),
        child: TextFormField(
          maxLines: null,
          minLines: 2,
          validator: (value) =>
              value.length < 3 ? 'Require 3 characters' : null,
          decoration:
              InputDecoration(border: InputBorder.none, labelText: 'Question'),
        ),
      ),
    );
  }

  Widget customOptionCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      elevation: 10,
      child: Container(
        margin: EdgeInsets.all(10),
        child: TextFormField(
          maxLines: null,
          minLines: 2,
          validator: (value) =>
              value.length < 3 ? 'Require 3 characters' : null,
          decoration:
              InputDecoration(border: InputBorder.none, labelText: 'Question'),
        ),
      ),
    );
  }
}
