import 'package:flutter/material.dart';
import 'package:todo_firebase/screens/login_screen.dart';
import 'package:todo_firebase/screens/signup_screen.dart';
import '../widgets/utilities/headings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image(image: AssetImage("assets/images/welcome.png")),
            ),
            SizedBox(height: 30),
            Heading(
              type: 1,
              text: "To Do",
            ),
            SizedBox(height: 15),
            Heading(
              type: 2,
              text: "Get organized,\nGet productive.",
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()));
                      },
                      child: Text("Sign up"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20))),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text("Log in"),
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 1, color: Colors.green),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
