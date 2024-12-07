/* 
  TO do repository

  Here we can define what the app can do


*/

import 'package:todo_using_bloc/domain/models/todo.dart';

abstract class TodoRepo {
  //get list of todo
  Future<List<Todo>> getTodos();

  //add a new todo
  Future<void> addTodo(Todo newTodo);

  //update an existing todo
  Future<void> updateTodo(Todo todo);

  //delete a todo
  Future<void> deleteTodo(Todo todo);
}

//NOTE - the repo in the domain laye outlines what operations tha app can do, but doesn't worry about the specific implementation details. That's foe the data layer.

//Technology agnostic: independent of any technology of framework


