import 'package:bundle/authentication/assign_role.dart';
import 'package:bundle/authentication/signin.dart';
import 'package:bundle/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Regulator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    if (user == null) {
      return SignIn();
    } else {
      return AssignRole();
    }
  }
}
