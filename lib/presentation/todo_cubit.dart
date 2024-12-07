//TODO CUBIT - simple state managment
//Each cubit is a list of todos

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_bloc/domain/models/repository/todo_repo.dart';
import 'package:todo_using_bloc/domain/models/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  //reference todo repo
  final TodoRepo todoRepo;

  //Constructor intialize the cubit with an empty list
  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  //LOAD
  Future<void> loadTodos() async {
    final todoList = await todoRepo.getTodos();
  }

  //ADD
  Future<void> addTodo(String text) async {
    //create a new todo with unique ID
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
    );
    //save the new todo to repo
    await todoRepo.addTodo(newTodo);

    //re-load
    loadTodos();
  }

  //DELETE
  Future<void> deleteTodo(Todo todo) async {
    //delete todo from repo
    await todoRepo.deleteTodo(todo);

    //re-load
    loadTodos();
  }

  //TOGGLE
  Future<void> toggleCompletion(Todo todo) async {
    //toggle the completion status of provided todo
    final updatedTodo = todo.toggleCompletion();

    //update the todo in repo with new completion status
    await todoRepo.updateTodo(updatedTodo);

    //re-load
    loadTodos();
  }
}
