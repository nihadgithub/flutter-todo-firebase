import 'package:flutter/material.dart';


class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
           Text("About"),
        ],
      ),
    );
  }
}
