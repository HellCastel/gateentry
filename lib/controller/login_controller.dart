import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ge_process/view/expand_design.dart';
import 'package:ge_process/view/mainscreen.dart';

class LoginController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
        msg: "Username and Password cannot be empty",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );
    } else if (username != "test") {
      Fluttertoast.showToast(
        msg: "Incorrect username",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
    } else if (password != "Welcome@123") {
      Fluttertoast.showToast(
        msg: "Incorrect password",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Mainscreen()),
      );
    }
  }
}
