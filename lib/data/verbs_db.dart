import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:irregularverbs/data/verbs_table.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

part 'verbs_db.g.dart';

@DriftDatabase(tables: [Verbs])
class VerbsDB extends _$VerbsDB {
  static const String _dbFileName = 'verbs.sqlite';

  VerbsDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Verb>> get allVerbs => select(verbs).get();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var dbPath = join(directory.path, VerbsDB._dbFileName);
    final dbFile = File(dbPath);

    // if database does not exist, copy it from assets
    if (!dbFile.existsSync()) {
      ByteData data = await rootBundle.load("assets/${VerbsDB._dbFileName}");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await dbFile.writeAsBytes(bytes);
    }

    return NativeDatabase(dbFile);
  });
}
