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
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                auth.signOut(context);
              },
              child: Text("Logout")),
        ],
      ),
    );
  }
}
