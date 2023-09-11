import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_firebase/screens/home_screen.dart';
import 'package:todo_firebase/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// Ideal time to initialize
 // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.green,
        useMaterial3: true,

        colorSchemeSeed: Colors.green,
        fontFamily: 'Inter',

      ),
      //home: const HomeScreen(title: 'ToDo FireBase'),
      home: WelcomeScreen(),
    );
  }
}
