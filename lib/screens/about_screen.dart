import 'package:flutter/material.dart';


class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("About"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Center(child: Text("Developed by Nihad",style: TextStyle(color: Colors.green[900]),)),
            onTap: (){},

            splashColor: Colors.green.withOpacity(.3),
            hoverColor: Colors.green,
          )
        ],
      ),
    );
  }
}
