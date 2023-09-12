import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firebase/models/todo_model.dart';

class TodoFirestore{
  FirebaseFirestore todosFirestore = FirebaseFirestore.instance;

  Future <void> addTodo(TodoModel todo) async{
      await todosFirestore.collection("todos").add({
        'text': todo.text,
        'isChecked':todo.isChecked
      });
  }



}