import 'package:drift/drift.dart';

class Verbs extends Table {
  TextColumn get infinitive => text()();

  TextColumn get past => text()();

  TextColumn get participle => text()();

  TextColumn get translation => text()();
}
