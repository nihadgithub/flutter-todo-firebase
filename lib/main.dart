import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_firebase/screens/about_screen.dart';
import 'package:todo_firebase/screens/home_screen.dart';
import 'package:todo_firebase/screens/settings_screen.dart';
import 'package:todo_firebase/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_firebase/services/preferences.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// Ideal time to initialize
 // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);


  await createPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  bool  status = getStatus();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(status);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.green,
        useMaterial3: true,

        colorSchemeSeed: Colors.green,
        fontFamily: 'Inter',

      ),
      //home: const HomeScreen(title: 'ToDo FireBase'),

      initialRoute:status ?'/home' :'/welcome',
      routes: {
        '/welcome' :(context)=>WelcomeScreen(),
        '/home' :(context)=>HomeScreen(),
        '/settings':(context)=>SettingsScreen(),
        '/about':(context)=>AboutScreen(),
      },
    );
  }
}
