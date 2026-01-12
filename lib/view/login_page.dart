import 'package:flutter/material.dart';
import 'package:ge_process/controller/login_controller.dart';
import 'package:ge_process/utils/fonts.dart';
import 'package:ge_process/utils/textformfieldwidget.dart';
import 'package:ge_process/view/mainscreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final LoginController loginController = LoginController();

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/bg2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth * 0.3,
              height: screenHeight * 0.7,
              child: Card(
                color: Colors.blue.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 45),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue.shade100,
                        Colors.blue.shade50,
                        Colors.blue.shade100,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 20,
                        shadowColor: Colors.blue.shade50,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.login_rounded, size: 30),
                        ),
                      ),

                      SizedBox(height: 30),
                      Text(
                        "ABC INFOTech Private Limited",
                        textAlign: TextAlign.center,
                        style: CommonText.textDataBlock15().copyWith(
                          color: Colors.black,

                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Do something today that your future self will thank you for",
                        textAlign: TextAlign.center,
                        style: CommonText.textDataBlock12(),
                      ),

                      SizedBox(height: 20),
                      CustomTextFieldCard(
                        controller: loginController.usernameController,
                        hintText: "User Name",
                        iconText: Icon(Icons.account_circle_outlined),

                      ),
                      SizedBox(height: 3),
                      SizedBox(
                        height: 50,
                        child: CustomTextFieldCard(

                          controller: loginController.passwordController,
                          hintText: "Password",
                          iconText: Icon(Icons.lock_open_rounded),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 60),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // optional rounded corners
                          ),
                        ),
                        onPressed: () {
                          loginController.login(context);
                        },
                        child: Text(
                          "Get Started",
                          style: CommonText.textDataBlock12Bgrey().copyWith(
                            color: Colors.white, // text color white
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
