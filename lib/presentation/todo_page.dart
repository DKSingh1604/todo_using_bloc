//TO DO PAGE: reponsible for providing cubit to view (UI)

// -USE BloC Provider

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_using_bloc/domain/models/repository/todo_repo.dart';
import 'package:todo_using_bloc/presentation/todo_cubit.dart';

class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;
  const TodoPage({
    super.key,
    required this.todoRepo,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepo),
      child: const TodoView(),
    );
  }
}
