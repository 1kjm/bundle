import 'dart:async';

import 'package:bundle/authentication/assign_role.dart';
import 'package:bundle/models/sizeconfig.dart';
import 'package:flutter/material.dart';

class PhoneVerification extends StatefulWidget {
  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  Timer retryTimer;
  int duration = 15;
  bool timerLapsedFlag = false;
  @override
  void initState() {
    retryTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (duration != 0) {
          duration--;
        }
      });
      if (duration == 0) {
        timerLapsedFlag = true;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    retryTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Image.asset('assets/bundleappbar.png'),
          ),
          body: Container(
              height: SizeConfig.screenHeight / 2,
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.all(10),
              child: Center(
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 10,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              showCursor: false,
                              style: TextStyle(fontSize: 26),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '****',
                              ),
                              obscureText: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () => onVerifyPressed(context),
                          child: Text(
                            'Verify',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Resend Message After'),
                            Text('$duration')
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Resend',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  void onVerifyPressed(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => AssignRole(),
    ));
  }
}
