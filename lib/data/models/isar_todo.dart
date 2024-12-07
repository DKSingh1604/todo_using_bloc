//ISAR TO DO MODEL

//Converts todo model into Isar todo model that we can store in our isar db

import 'package:isar/isar.dart';
import 'package:todo_using_bloc/domain/models/todo.dart';

//to generate isar todo object, run: dart run build_runner build
part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  //convert isar objects -> pure todo object to use it in our app
  Todo toDomain() {
    return Todo(
      id: id,
      text: text,
      isCompleted: isCompleted,
    );
  }

  //convert pure todo object -> isar object to store in isar db
  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}
