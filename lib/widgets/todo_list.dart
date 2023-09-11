import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(

              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: CheckboxListTile(
                value:false,

                onChanged: (newValue) {
                  setState(() {

                  });
                },
                title: Text("Item"),

            ),
          ));
        });
  }
}
