import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_firebase/screens/welcome_screen.dart';
import 'package:todo_firebase/widgets/add_todo.dart';
import 'package:todo_firebase/widgets/todo_list.dart';

import '../services/firebase_services.dart';

enum PopupMenuItems { settings, about, logOut }

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  /*PopupMenuItems? selectedMenu;*/

  var selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        leading: Text(""),
        actions: [
          /*IconButton(onPressed: (){
          }, icon: Icon(Icons.more_vert))*/

          PopupMenuButton(
              /*initialValue: selectedMenu,*/
              onSelected: (item) {
                setState(() {
                  selectedMenu = item.toString();
                });
                Navigator.pushNamed(context, item.toString());
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry>[
                    const PopupMenuItem(
                      value: '/settings',
                      child: Text('Settings'),
                    ),
                    const PopupMenuItem(
                      value: '/about',
                      child: Text('About'),
                    ),
                    /*const PopupMenuItem(
                      value: '/settings',
                      child: Text('Logout'),
                    ),*/
                  ])
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(child: TodoForm());
            },
            //useSafeArea: true,
            backgroundColor: Colors.white,
            //shape: ContinuousRectangleBorder(),
            isScrollControlled: true,
          );
        },
        tooltip: "Add new ToDo",
        icon: Icon(Icons.add),
        label: Text("Add To Do"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      body: Column(
        children: [

          Flexible(child: TodoList()),

          //Container(height: 200,color: Colors.red,)
        ],
      ),
      //bottomNavigationBar: BottomAppBar(),
    );
  }
}
