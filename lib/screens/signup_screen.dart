import 'package:flutter/material.dart';
import 'package:todo_firebase/widgets/utilities/headings.dart';
import 'package:todo_firebase/screens/home_screen.dart';
import 'package:todo_firebase/services/firebase_services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage("assets/images/tasks.png")),
              Heading(type: 1, text: "Signup"),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(borderSide: BorderSide()),
                prefixIcon: Icon(Icons.person),
              )),
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
                obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      prefixIcon: Icon(Icons.password),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () async{
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));*/

                          //print('Email : ${_emailController.text},Password : ${_passwordController.text},Name : ${_nameController.text}');
                          if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty && _nameController.text.isNotEmpty){

                            String ? sucess = await auth.registration(email: _emailController.text, password: _passwordController.text);

                            if(sucess==''){

                            }
                          }



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
            ],
          ),
        ),
      ),
    );
  }
}
