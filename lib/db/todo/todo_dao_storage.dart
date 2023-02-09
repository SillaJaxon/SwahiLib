import 'package:drift/drift.dart';
import 'package:flota/db/flota_db.dart';
import 'package:flota/model/db/todo/db_todo_table.dart';
import 'package:flota/model/webservice/todo/todo.dart';
import 'package:injectable/injectable.dart';

part 'todo_dao_storage.g.dart';

@lazySingleton
abstract class TodoDaoStorage {
  @factoryMethod
  factory TodoDaoStorage(FlotaDb db) = _TodoDaoStorage;

  Stream<List<Todo>> getAllTodosStream();

  Future<List<Todo>> getAllTodos();

  Future<void> createTodo(String todo);

  Future<void> createTodoWithValue(Todo todo);

  Future<void> updateTodo({required int id, required bool completed});
}

@DriftAccessor(tables: [
  DbTodoTable,
])
class _TodoDaoStorage extends DatabaseAccessor<FlotaDb> with _$_TodoDaoStorageMixin implements TodoDaoStorage {
  _TodoDaoStorage(super.db);

  @override
  Future<List<Todo>> getAllTodos() => select(db.dbTodoTable).map((item) => item.getModel()).get();

  @override
  Stream<List<Todo>> getAllTodosStream() => select(db.dbTodoTable).map((item) => item.getModel()).watch();

  @override
  Future<void> createTodo(String todo) => into(db.dbTodoTable).insert(DbTodoTableCompanion.insert(title: todo, completed: false));

  @override
  Future<void> createTodoWithValue(Todo todo) async => into(db.dbTodoTable).insert(DbTodoTableCompanion.insert(title: todo.title, completed: todo.completed));

  @override
  Future<void> updateTodo({required int id, required bool completed}) =>
      (update(db.dbTodoTable)..where((todo) => todo.id.equals(id))).write(DbTodoTableCompanion(completed: Value(completed)));
}
