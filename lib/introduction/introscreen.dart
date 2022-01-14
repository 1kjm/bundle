import 'package:bundle/introduction/intro_features.dart';
import 'package:bundle/models/sizeconfig.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('introScreen_P Build');
    SizeConfig().init(context);
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/Bundlesplashscreen.png'),
                  SizedBox(
                    height: SizeConfig.screenHeight / 8,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.cyan,
                    child: ListTile(
                      onTap: () => _onListTileTap(context),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Begin My Journey'),
                        ],
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
      print('introScreen_L Build');
      return Scaffold(
        body: Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Center(
              child: Container(
                child: Row(
                  children: [
                    Image.asset('assets/Bundlesplashscreen.png'),
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
                              const Text('Begin My Journey'),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      );
    }
  }

  void _onListTileTap(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        return IntroFeatures();
      },
    ));
  }
}
