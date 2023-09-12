import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_firebase/services/preferences.dart';
import 'package:todo_firebase/widgets/utilities/headings.dart';

import '../services/firebase_services.dart';
import 'home_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left:25,right: 25,top: 15,bottom: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage("assets/images/tasks.png")),
              Heading(type: 1, text: "Login"),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      prefixIcon: Icon(Icons.mail))),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      prefixIcon: Icon(Icons.password))),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () async{
                          if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty ){

                            setState(() {
                              loading =true;
                            });
                            String? status =  await auth.login(email: _emailController.text, password: _passwordController.text);
                            if(status!=null && status=='Success' ){
                              await setStatus();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                            }

                            setState(() {
                              loading = false;
                            });
                          }
                          else{


                          }

                        },
                        
                        child:loading ? CircularProgressIndicator(color: Colors.white,)   :Text("Log in"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
