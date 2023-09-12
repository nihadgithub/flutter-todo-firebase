import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_firebase/services/firestore_services.dart';
import 'package:todo_firebase/widgets/utilities/headings.dart';

import 'package:todo_firebase/models/todo_model.dart';

class EditTodo extends StatelessWidget {
  EditTodo({super.key, required this.data});
  TextEditingController todoText = TextEditingController();
  DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {

    todoText.text = data['text'];

    return Padding(
      //padding: const EdgeInsets.all(15),
      padding: EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 35,
          ),
          Heading(type: 2, text: "Edit To Do"),
          SizedBox(
            height: 35,
          ),
          TextField(
              controller: todoText,
              minLines: 2,
              maxLines: 10,

              decoration: InputDecoration(
                hintText: "Enter new item ",
                filled: true,
                fillColor: Colors.green[50],
              ),
              autofocus: true),
          SizedBox(
            height: 15,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () async{
                  TodoModel todoModel = TodoModel(text: todoText.text,isChecked: false);
                  await TodoFirestore().editTodo(data.id,todoText.text);
                  Navigator.pop(context);
                },
                label: Text("Save"),
                icon: Icon(Icons.save),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 22)),
              )),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
