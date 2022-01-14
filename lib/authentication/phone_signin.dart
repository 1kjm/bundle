import 'package:bundle/authentication/phone_verification.dart';
import 'package:bundle/models/sizeconfig.dart';
import 'package:flutter/material.dart';

class PhoneSignIn extends StatefulWidget {
  @override
  _PhoneSignInState createState() => _PhoneSignInState();
}

class _PhoneSignInState extends State<PhoneSignIn> {
  String validatePhoneNumber(String value) {
    String pattern = '([0-9])';
    RegExp regExp = RegExp(pattern);
    if (value.length > 0 && value.length < 10 || value.length > 11) {
      return 'Check Your Phone Number';
    } else if (value.length == 0) {
      return 'Required';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter Valid Phone Number';
    }
    return null;
  }

  Future onSendOtpPressed() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      return alertBoxWidget(phoneNumber);
    } else
      return null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();
  String phoneNumber;
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
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: SizeConfig.screenHeight / 4,
                      width: SizeConfig.screenWidth / 2,
                      child: Image.asset('assets/icons/phone.png'),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight / 15,
                    ),
                    Form(
                        key: _formkey,
                        child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            margin: EdgeInsets.all(10),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              // width: SizeConfig.screenWidth * 0.8,
                              child: TextFormField(
                                onSaved: (newValue) {
                                  setState(() {
                                    phoneNumber = newValue;
                                  });
                                },
                                validator: (value) =>
                                    validatePhoneNumber(value),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Your Phone Number'),
                              ),
                            ))),
                    Container(
                      height: 45,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () async {
                          await onSendOtpPressed();
                        },
                        child: Text(
                          'Send OTP',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future alertBoxWidget(String phoneNumber) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text('verify'),
            content: Text(
              "$phoneNumber is correct?",
            ),
            actions: [
              TextButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PhoneVerification(),
                  ));
                },
              ),
              TextButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
