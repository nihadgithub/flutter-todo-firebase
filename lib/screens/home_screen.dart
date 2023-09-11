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
  AuthService auth = AuthService();

  PopupMenuItems? selectedMenu;

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

          PopupMenuButton<PopupMenuItems>(
              initialValue: selectedMenu,
              onSelected: (PopupMenuItems item) {
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<PopupMenuItems>>[
                    const PopupMenuItem<PopupMenuItems>(
                      value: PopupMenuItems.settings,
                      child: Text('Settings'),
                    ),
                    const PopupMenuItem<PopupMenuItems>(
                      value: PopupMenuItems.about,
                      child: Text('About'),
                    ),
                    const PopupMenuItem<PopupMenuItems>(
                      value: PopupMenuItems.logOut,
                      child: Text('Logout'),
                    ),
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
          ElevatedButton(
              onPressed: () {
                auth.signOut(context);
              },
              child: Text("Logout")),

          Flexible(child: TodoList()),

          //Container(height: 200,color: Colors.red,)
        ],
      ),
      //bottomNavigationBar: BottomAppBar(),
    );
  }
}
