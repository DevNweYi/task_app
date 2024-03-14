// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TitleDao? _titleDaoInstance;

  TaskDao? _taskDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `title` (`titleId` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `titleName` TEXT NOT NULL, `imageName` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task` (`taskId` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `titleId` INTEGER NOT NULL, `taskName` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TitleDao get titleDao {
    return _titleDaoInstance ??= _$TitleDao(database, changeListener);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }
}

class _$TitleDao extends TitleDao {
  _$TitleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _titleInsertionAdapter = InsertionAdapter(
            database,
            'title',
            (Title item) => <String, Object?>{
                  'titleId': item.titleId,
                  'titleName': item.titleName,
                  'imageName': item.imageName
                },
            changeListener),
        _titleUpdateAdapter = UpdateAdapter(
            database,
            'title',
            ['titleId'],
            (Title item) => <String, Object?>{
                  'titleId': item.titleId,
                  'titleName': item.titleName,
                  'imageName': item.imageName
                },
            changeListener),
        _titleDeletionAdapter = DeletionAdapter(
            database,
            'title',
            ['titleId'],
            (Title item) => <String, Object?>{
                  'titleId': item.titleId,
                  'titleName': item.titleName,
                  'imageName': item.imageName
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Title> _titleInsertionAdapter;

  final UpdateAdapter<Title> _titleUpdateAdapter;

  final DeletionAdapter<Title> _titleDeletionAdapter;

  @override
  Stream<List<Title>> getAllTitle() {
    return _queryAdapter.queryListStream('select * from title',
        mapper: (Map<String, Object?> row) => Title(
            titleId: row['titleId'] as int,
            titleName: row['titleName'] as String,
            imageName: row['imageName'] as String),
        queryableName: 'title',
        isView: false);
  }

  @override
  Future<Title?> getTitle(int titleId) async {
    return _queryAdapter.query('select * from title where titleId=?1',
        mapper: (Map<String, Object?> row) => Title(
            titleId: row['titleId'] as int,
            titleName: row['titleName'] as String,
            imageName: row['imageName'] as String),
        arguments: [titleId]);
  }

  @override
  Future<void> addTitle(Title title) async {
    await _titleInsertionAdapter.insert(title, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTitle(Title title) async {
    await _titleUpdateAdapter.update(title, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTitle(Title title) async {
    await _titleDeletionAdapter.delete(title);
  }

  @override
  Future<void> deleteAllTitle(List<Title> titles) async {
    await _titleDeletionAdapter.deleteList(titles);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _taskInsertionAdapter = InsertionAdapter(
            database,
            'task',
            (Task item) => <String, Object?>{
                  'taskId': item.taskId,
                  'titleId': item.titleId,
                  'taskName': item.taskName
                },
            changeListener),
        _taskUpdateAdapter = UpdateAdapter(
            database,
            'task',
            ['taskId'],
            (Task item) => <String, Object?>{
                  'taskId': item.taskId,
                  'titleId': item.titleId,
                  'taskName': item.taskName
                },
            changeListener),
        _taskDeletionAdapter = DeletionAdapter(
            database,
            'task',
            ['taskId'],
            (Task item) => <String, Object?>{
                  'taskId': item.taskId,
                  'titleId': item.titleId,
                  'taskName': item.taskName
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Task> _taskInsertionAdapter;

  final UpdateAdapter<Task> _taskUpdateAdapter;

  final DeletionAdapter<Task> _taskDeletionAdapter;

  @override
  Stream<List<Task>> getAllTask() {
    return _queryAdapter.queryListStream('select * from task',
        mapper: (Map<String, Object?> row) => Task(
            taskId: row['taskId'] as int,
            titleId: row['titleId'] as int,
            taskName: row['taskName'] as String),
        queryableName: 'task',
        isView: false);
  }

  @override
  Future<void> addTask(Task task) async {
    await _taskInsertionAdapter.insert(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTask(Task task) async {
    await _taskUpdateAdapter.update(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTask(Task task) async {
    await _taskDeletionAdapter.delete(task);
  }

  @override
  Future<void> deleteAllTask(List<Task> tasks) async {
    await _taskDeletionAdapter.deleteList(tasks);
  }
}
