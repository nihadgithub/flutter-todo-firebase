import 'package:flutter/material.dart';
import 'package:todo_firebase/models/todo_model.dart';

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

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: todoList
          .map((e) => CheckboxListTile(
              value: e.isChecked,
              title: Text(e.text.toString()),
              onChanged: (bool? val) {
                setState(() {
                  e.isChecked = val;
                });
              }))
          .toList(),
    );
  }
}
