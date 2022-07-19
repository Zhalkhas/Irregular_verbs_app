// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verbs_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Verb extends DataClass implements Insertable<Verb> {
  final String infinitive;
  final String past;
  final String participle;
  final String translation;
  Verb(
      {required this.infinitive,
      required this.past,
      required this.participle,
      required this.translation});
  factory Verb.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Verb(
      infinitive: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}infinitive'])!,
      past: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}past'])!,
      participle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}participle'])!,
      translation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}translation'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['infinitive'] = Variable<String>(infinitive);
    map['past'] = Variable<String>(past);
    map['participle'] = Variable<String>(participle);
    map['translation'] = Variable<String>(translation);
    return map;
  }

  VerbsCompanion toCompanion(bool nullToAbsent) {
    return VerbsCompanion(
      infinitive: Value(infinitive),
      past: Value(past),
      participle: Value(participle),
      translation: Value(translation),
    );
  }

  factory Verb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Verb(
      infinitive: serializer.fromJson<String>(json['infinitive']),
      past: serializer.fromJson<String>(json['past']),
      participle: serializer.fromJson<String>(json['participle']),
      translation: serializer.fromJson<String>(json['translation']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'infinitive': serializer.toJson<String>(infinitive),
      'past': serializer.toJson<String>(past),
      'participle': serializer.toJson<String>(participle),
      'translation': serializer.toJson<String>(translation),
    };
  }

  Verb copyWith(
          {String? infinitive,
          String? past,
          String? participle,
          String? translation}) =>
      Verb(
        infinitive: infinitive ?? this.infinitive,
        past: past ?? this.past,
        participle: participle ?? this.participle,
        translation: translation ?? this.translation,
      );
  @override
  String toString() {
    return (StringBuffer('Verb(')
          ..write('infinitive: $infinitive, ')
          ..write('past: $past, ')
          ..write('participle: $participle, ')
          ..write('translation: $translation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(infinitive, past, participle, translation);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Verb &&
          other.infinitive == this.infinitive &&
          other.past == this.past &&
          other.participle == this.participle &&
          other.translation == this.translation);
}

class VerbsCompanion extends UpdateCompanion<Verb> {
  final Value<String> infinitive;
  final Value<String> past;
  final Value<String> participle;
  final Value<String> translation;
  const VerbsCompanion({
    this.infinitive = const Value.absent(),
    this.past = const Value.absent(),
    this.participle = const Value.absent(),
    this.translation = const Value.absent(),
  });
  VerbsCompanion.insert({
    required String infinitive,
    required String past,
    required String participle,
    required String translation,
  })  : infinitive = Value(infinitive),
        past = Value(past),
        participle = Value(participle),
        translation = Value(translation);
  static Insertable<Verb> custom({
    Expression<String>? infinitive,
    Expression<String>? past,
    Expression<String>? participle,
    Expression<String>? translation,
  }) {
    return RawValuesInsertable({
      if (infinitive != null) 'infinitive': infinitive,
      if (past != null) 'past': past,
      if (participle != null) 'participle': participle,
      if (translation != null) 'translation': translation,
    });
  }

  VerbsCompanion copyWith(
      {Value<String>? infinitive,
      Value<String>? past,
      Value<String>? participle,
      Value<String>? translation}) {
    return VerbsCompanion(
      infinitive: infinitive ?? this.infinitive,
      past: past ?? this.past,
      participle: participle ?? this.participle,
      translation: translation ?? this.translation,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (infinitive.present) {
      map['infinitive'] = Variable<String>(infinitive.value);
    }
    if (past.present) {
      map['past'] = Variable<String>(past.value);
    }
    if (participle.present) {
      map['participle'] = Variable<String>(participle.value);
    }
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VerbsCompanion(')
          ..write('infinitive: $infinitive, ')
          ..write('past: $past, ')
          ..write('participle: $participle, ')
          ..write('translation: $translation')
          ..write(')'))
        .toString();
  }
}

class $VerbsTable extends Verbs with TableInfo<$VerbsTable, Verb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VerbsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _infinitiveMeta = const VerificationMeta('infinitive');
  @override
  late final GeneratedColumn<String?> infinitive = GeneratedColumn<String?>(
      'infinitive', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _pastMeta = const VerificationMeta('past');
  @override
  late final GeneratedColumn<String?> past = GeneratedColumn<String?>(
      'past', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _participleMeta = const VerificationMeta('participle');
  @override
  late final GeneratedColumn<String?> participle = GeneratedColumn<String?>(
      'participle', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _translationMeta =
      const VerificationMeta('translation');
  @override
  late final GeneratedColumn<String?> translation = GeneratedColumn<String?>(
      'translation', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [infinitive, past, participle, translation];
  @override
  String get aliasedName => _alias ?? 'verbs';
  @override
  String get actualTableName => 'verbs';
  @override
  VerificationContext validateIntegrity(Insertable<Verb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('infinitive')) {
      context.handle(
          _infinitiveMeta,
          infinitive.isAcceptableOrUnknown(
              data['infinitive']!, _infinitiveMeta));
    } else if (isInserting) {
      context.missing(_infinitiveMeta);
    }
    if (data.containsKey('past')) {
      context.handle(
          _pastMeta, past.isAcceptableOrUnknown(data['past']!, _pastMeta));
    } else if (isInserting) {
      context.missing(_pastMeta);
    }
    if (data.containsKey('participle')) {
      context.handle(
          _participleMeta,
          participle.isAcceptableOrUnknown(
              data['participle']!, _participleMeta));
    } else if (isInserting) {
      context.missing(_participleMeta);
    }
    if (data.containsKey('translation')) {
      context.handle(
          _translationMeta,
          translation.isAcceptableOrUnknown(
              data['translation']!, _translationMeta));
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Verb map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Verb.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $VerbsTable createAlias(String alias) {
    return $VerbsTable(attachedDatabase, alias);
  }
}

abstract class _$VerbsDB extends GeneratedDatabase {
  _$VerbsDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $VerbsTable verbs = $VerbsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [verbs];
}
