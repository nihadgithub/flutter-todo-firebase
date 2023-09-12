import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:todo_firebase/models/todo_model.dart';
import 'package:todo_firebase/services/firestore_services.dart';
import 'package:todo_firebase/widgets/edit_todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<TodoModel> todoList = [
    TodoModel(text: "Item 1", isChecked: false),
    TodoModel(text: "Item 2", isChecked: true),
    TodoModel(text: "Item 3", isChecked: false),
  ];

  TodoFirestore todoObject = TodoFirestore();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: todoObject.getTodo(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    //print(data.id);
                    return GestureDetector(
                      onLongPress: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Column(

                                children: [
                                  SizedBox(height: 15,),
                                  ListTile(
                                    title: Text("Edit"),
                                    leading: Icon(Icons.edit),
                                    onTap: (){
                                      Navigator.pop(context);
                                      showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SingleChildScrollView(child: EditTodo(data: data,));
                                        },
                                        //useSafeArea: true,
                                        backgroundColor: Colors.white,
                                        //shape: ContinuousRectangleBorder(),
                                        isScrollControlled: true,
                                      );
                                    },
                                  ),
                                  ListTile(
                                    title: Text("Delete"),
                                    leading: Icon(Icons.delete),
                                    onTap: (){
                                      Navigator.of(context).pop();
                                      showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Do you want to delete?'),
                                            /*content: const Text(
                                              'dialog ',
                                            ),*/
                                            actions: <Widget>[
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  textStyle: Theme.of(context).textTheme.labelLarge,
                                                ),
                                                child: const Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  textStyle: Theme.of(context).textTheme.labelLarge,
                                                ),
                                                child: const Text('Yes'),
                                                onPressed: () async{
                                                  await TodoFirestore().deleteTodo(data.id);
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          //useSafeArea: true,
                          backgroundColor: Colors.white,
                          //shape: ContinuousRectangleBorder(),
                          //isScrollControlled: true,
                        );
                      },
                      child: CheckboxListTile(
                        title: Text(data['text']),
                        value: data['isChecked'],
                        onChanged: (bool? newValue) {
                          todoObject.updateTodo(data.id, newValue!);
                        },
                      ),
                    );
                  });
        });
  }
}
