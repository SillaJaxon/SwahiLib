import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flota/db/flota_db.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FlotaDb sut;

  setUp(() async {
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    sut = FlotaDb(NativeDatabase.memory());
  });

  tearDown(() async {
    await sut.deleteAllData();
  });

  test('FlotaDb should have the correct version', () {
    expect(sut.schemaVersion, 1);
  });

  test('FlotaDb should delete all tables', () async {
    final resultTodos1 = await sut.select(sut.dbTodoTable).get();
    expect(resultTodos1.isEmpty, true);

    await sut.into(sut.dbTodoTable).insert(DbTodoTableCompanion.insert(title: 'todo1', completed: true));
    await sut.into(sut.dbTodoTable).insert(DbTodoTableCompanion.insert(title: 'todo2', completed: true));
    await sut.into(sut.dbTodoTable).insert(DbTodoTableCompanion.insert(title: 'todo3', completed: true));

    final resultTodos2 = await sut.select(sut.dbTodoTable).get();
    expect(resultTodos2.isEmpty, false);
    expect(resultTodos2.length, 3);

    await sut.deleteAllData();

    final resultTodos3 = await sut.select(sut.dbTodoTable).get();
    expect(resultTodos3.isEmpty, true);
  });
}
