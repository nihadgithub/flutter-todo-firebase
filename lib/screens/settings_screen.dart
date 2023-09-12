import 'package:flutter/material.dart';

import '../services/firebase_services.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Logout",style: TextStyle(color: Colors.red[900]),),
            onTap: (){
              auth.signOut(context);
            },


            splashColor: Colors.red.withOpacity(.3),
            hoverColor: Colors.blue,
          )
        ],
      ),
    );
  }
}

/*

Column(
children: [
ElevatedButton(
onPressed: () {
auth.signOut(context);
},
child: Text("Logout")),
],
),*/
