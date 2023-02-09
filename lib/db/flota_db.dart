import 'package:drift/drift.dart';
import 'package:flota/model/db/todo/db_todo_table.dart';

part 'flota_db.g.dart';

@DriftDatabase(tables: [
  DbTodoTable,
])
class FlotaDb extends _$FlotaDb {
  FlotaDb(super.db);

  FlotaDb.connect(DatabaseConnection connection) : super.connect(connection);

  @override
  int get schemaVersion => 1;

  Future<void> deleteAllData() {
    return transaction(() async {
      for (final table in allTables) {
        await delete<Table, dynamic>(table).go();
      }
    });
  }
}
