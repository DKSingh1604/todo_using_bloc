//RESPONSIBLE FOR THE UI

//Use a BlocBuilder

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_bloc/domain/models/todo.dart';
import 'package:todo_using_bloc/presentation/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  //show dialog box for user to type
  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();

    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(content: TextField(controller: textController), actions: [
        //cancel button
        TextButton(
          onPressed: () => Navigator.of(context).pop,
          child: const Text("Cancel"),
        ),

        //add button
        TextButton(
          onPressed: () {
            todoCubit.addTodo(textController.text);
            Navigator.of(context).pop();
          },
          child: Text("Add"),
        ),
      ]),
    );
  }

  //Buuld UI
  @override
  Widget build(BuildContext context) {
    //todo cubit
    final todoCubit = context.read<TodoCubit>();

    //SCAFFOLD
    return Scaffold(
      //FAB
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddTodoBox(context),
      ),

      //Bloc Builder
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              //get individual todo from todos list
              final todo = todos[index];

              //List tile UI
              return ListTile(
                //text
                title: Text(todo.text),

                //checkbox
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) => todoCubit.toggleCompletion(todo),
                ),

                //delete button
                trailing: IconButton(
                  onPressed: () => todoCubit.deleteTodo(todo),
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
