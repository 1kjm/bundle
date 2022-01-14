import 'package:flutter/Material.dart';

class DrawerBody extends StatefulWidget {
  @override
  _DrawerBodyState createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        customDrawerItem(
            imageLocation: 'assets/icons/homepage.png', text: 'Back To Feeds'),
        customDrawerItem(
            imageLocation: 'assets/icons/userprofile.png', text: 'My Profile'),
        customDrawerItem(
            imageLocation: 'assets/icons/question.png', text: 'Help'),
        customDrawerItem(imageLocation: 'assets/icons/info.png', text: 'About'),
      ],
    ));
  }

  Widget customDrawerItem(
      {@required String imageLocation, @required String text}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: 50,
            child: Image.asset('$imageLocation'),
          ),
          Text('$text')
        ],
      ),
    );
  }
}
