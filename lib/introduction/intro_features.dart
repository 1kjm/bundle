import 'package:bundle/authentication/signin.dart';
import 'package:bundle/models/sizeconfig.dart';
import 'package:flutter/material.dart';

class IntroFeatures extends StatefulWidget {
  @override
  _IntroFeaturesState createState() => _IntroFeaturesState();
}

int _groupValue = 0;
List<String> imagesList = [
  'assets/introscreen1.png',
  'assets/introscreen2.png'
];

class _IntroFeaturesState extends State<IntroFeatures> {
  @override
  Widget build(BuildContext context) {
    print('introFeatures_P Build');
    SizeConfig().init(context);
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.95,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: SizeConfig.screenWidth * 0.9,
                      height: SizeConfig.screenHeight / 2,
                      child: Image.asset(
                        imagesList[_groupValue],
                        fit: BoxFit.cover,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                          value: 0,
                          groupValue: _groupValue,
                          onChanged: (value) => _onRadioButtonTapped(value)),
                      Radio(
                          value: 1,
                          groupValue: _groupValue,
                          onChanged: (value) => _onRadioButtonTapped(value))
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.cyan,
                    child: Container(
                      width: SizeConfig.screenWidth / 3,
                      child: ListTile(
                        onTap: () => _onListTileTap(context),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: const Text('Continue')),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      print('introFeatures_L Build');
      return SafeArea(
        child: Scaffold(
          body: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.95,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                          width: SizeConfig.screenWidth * 0.5,
                          height: SizeConfig.screenHeight * 0.75,
                          child: Image.asset(
                            imagesList[_groupValue],
                            fit: BoxFit.cover,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                              value: 0,
                              groupValue: _groupValue,
                              onChanged: (value) =>
                                  _onRadioButtonTapped(value)),
                          Radio(
                              value: 1,
                              groupValue: _groupValue,
                              onChanged: (value) => _onRadioButtonTapped(value))
                        ],
                      ),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.cyan,
                    child: Container(
                      width: SizeConfig.screenWidth / 3,
                      child: ListTile(
                        onTap: () => _onListTileTap(context),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: const Text('Continue')),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  void _onRadioButtonTapped(int value) {
    setState(() {
      _groupValue = value;
    });
  }

  void _onListTileTap(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        return SignIn();
      },
    ));
  }
}
