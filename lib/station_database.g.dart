// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $StationDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $StationDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $StationDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<StationDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorStationDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $StationDatabaseBuilderContract databaseBuilder(String name) =>
      _$StationDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $StationDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$StationDatabaseBuilder(null);
}

class _$StationDatabaseBuilder implements $StationDatabaseBuilderContract {
  _$StationDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $StationDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $StationDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<StationDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$StationDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$StationDatabase extends StationDatabase {
  _$StationDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StationDao? _stationDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `stations` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `latitude` REAL, `longitude` REAL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StationDao get stationDao {
    return _stationDaoInstance ??= _$StationDao(database, changeListener);
  }
}

class _$StationDao extends StationDao {
  _$StationDao(
    this.database,
    this.changeListener,
  ) : _queryAdapter = QueryAdapter(database);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  @override
  Future<List<Station>> selectStations() async {
    return _queryAdapter.queryList('select * from stations',
        mapper: (Map<String, Object?> row) => Station(
            id: row['id'] as int?,
            name: row['name'] as String,
            latitude: row['latitude'] as double?,
            longitude: row['longitude'] as double?));
  }
}
