// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

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

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

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
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
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
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ActiviteDao _activityDaoInstance;

  ParticipantDao _participantDaoInstance;

  TypeActivityDao _typeParticipantDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `Activity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `remoteId` INTEGER, `dateActivity` INTEGER, `heureDebut` INTEGER, `heureFin` INTEGER, `name` TEXT, `calorie` REAL, `step` INTEGER, `typeActivite` INTEGER, `distance` REAL, `minuteActive` INTEGER, `duree` INTEGER, `latitude` REAL, `longitude` REAL, `idParticipant` INTEGER, FOREIGN KEY (`idParticipant`) REFERENCES `Participant` (`remoteId`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Participant` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `remoteId` INTEGER, `email` TEXT, `dateNaiss` INTEGER, `datNaiss` INTEGER, `genre` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TypeActivity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `remoteId` INTEGER, `nom` TEXT, `numero` INTEGER)');
        await database.execute(
            'CREATE INDEX `index_Activity_idParticipant` ON `Activity` (`idParticipant`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ActiviteDao get activityDao {
    return _activityDaoInstance ??= _$ActiviteDao(database, changeListener);
  }

  @override
  ParticipantDao get participantDao {
    return _participantDaoInstance ??=
        _$ParticipantDao(database, changeListener);
  }

  @override
  TypeActivityDao get typeParticipantDao {
    return _typeParticipantDaoInstance ??=
        _$TypeActivityDao(database, changeListener);
  }
}

class _$ActiviteDao extends ActiviteDao {
  _$ActiviteDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _participantInsertionAdapter = InsertionAdapter(
            database,
            'Participant',
            (Participant item) => <String, dynamic>{
                  'id': item.id,
                  'remoteId': item.remoteId,
                  'email': item.email,
                  'dateNaiss': item.dateNaiss,
                  'datNaiss': _dateTimeConverter.encode(item.datNaiss),
                  'genre': item.genre
                },
            changeListener),
        _participantUpdateAdapter = UpdateAdapter(
            database,
            'Participant',
            ['id'],
            (Participant item) => <String, dynamic>{
                  'id': item.id,
                  'remoteId': item.remoteId,
                  'email': item.email,
                  'dateNaiss': item.dateNaiss,
                  'datNaiss': _dateTimeConverter.encode(item.datNaiss),
                  'genre': item.genre
                },
            changeListener),
        _participantDeletionAdapter = DeletionAdapter(
            database,
            'Participant',
            ['id'],
            (Participant item) => <String, dynamic>{
                  'id': item.id,
                  'remoteId': item.remoteId,
                  'email': item.email,
                  'dateNaiss': item.dateNaiss,
                  'datNaiss': _dateTimeConverter.encode(item.datNaiss),
                  'genre': item.genre
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Participant> _participantInsertionAdapter;

  final UpdateAdapter<Participant> _participantUpdateAdapter;

  final DeletionAdapter<Participant> _participantDeletionAdapter;

  @override
  Future<List<Participant>> getParticipants() async {
    return _queryAdapter.queryList('SELECT * from participant',
        mapper: (Map<String, dynamic> row) => Participant(
            id: row['id'] as int,
            remoteId: row['remoteId'] as int,
            email: row['email'] as String,
            dateNaiss: row['dateNaiss'] as int,
            datNaiss: _dateTimeConverter.decode(row['datNaiss'] as int),
            genre: row['genre'] as String));
  }

  @override
  Stream<List<Participant>> watchParticipants() {
    return _queryAdapter.queryListStream('SELECT * from participant',
        queryableName: 'Participant',
        isView: false,
        mapper: (Map<String, dynamic> row) => Participant(
            id: row['id'] as int,
            remoteId: row['remoteId'] as int,
            email: row['email'] as String,
            dateNaiss: row['dateNaiss'] as int,
            datNaiss: _dateTimeConverter.decode(row['datNaiss'] as int),
            genre: row['genre'] as String));
  }

  @override
  Future<Participant> getParticipant(int id) async {
    return _queryAdapter.query('SELECT * from participant where id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Participant(
            id: row['id'] as int,
            remoteId: row['remoteId'] as int,
            email: row['email'] as String,
            dateNaiss: row['dateNaiss'] as int,
            datNaiss: _dateTimeConverter.decode(row['datNaiss'] as int),
            genre: row['genre'] as String));
  }

  @override
  Future<Participant> getParticipantByRemote(int remoteId) async {
    return _queryAdapter.query('SELECT * from participant where remoteId = ?',
        arguments: <dynamic>[remoteId],
        mapper: (Map<String, dynamic> row) => Participant(
            id: row['id'] as int,
            remoteId: row['remoteId'] as int,
            email: row['email'] as String,
            dateNaiss: row['dateNaiss'] as int,
            datNaiss: _dateTimeConverter.decode(row['datNaiss'] as int),
            genre: row['genre'] as String));
  }

  @override
  Future<void> length() async {
    await _queryAdapter.queryNoReturn('Select count(*) from participant');
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('Delete from participant');
  }

  @override
  Future<void> deleteByRemote(int remoteId) async {
    await _queryAdapter.queryNoReturn(
        'Delete from participant where remoteId = ?',
        arguments: <dynamic>[remoteId]);
  }

  @override
  Future<int> insertParticipant(Participant participant) {
    return _participantInsertionAdapter.insertAndReturnId(
        participant, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateParticipant(Participant participant) {
    return _participantUpdateAdapter.updateAndReturnChangedRows(
        participant, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteParticipant(Participant participant) async {
    await _participantDeletionAdapter.delete(participant);
  }
}

class _$ParticipantDao extends ParticipantDao {
  _$ParticipantDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _activityInsertionAdapter = InsertionAdapter(
            database,
            'Activity',
            (Activity item) => <String, dynamic>{
                  'id': item.id,
                  'remoteId': item.remoteId,
                  'dateActivity': _dateTimeConverter.encode(item.dateActivity),
                  'heureDebut': item.heureDebut,
                  'heureFin': item.heureFin,
                  'name': item.name,
                  'calorie': item.calorie,
                  'step': item.step,
                  'typeActivite': item.typeActivite,
                  'distance': item.distance,
                  'minuteActive': item.minuteActive,
                  'duree': item.duree,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'idParticipant': item.idParticipant
                },
            changeListener),
        _activityUpdateAdapter = UpdateAdapter(
            database,
            'Activity',
            ['id'],
            (Activity item) => <String, dynamic>{
                  'id': item.id,
                  'remoteId': item.remoteId,
                  'dateActivity': _dateTimeConverter.encode(item.dateActivity),
                  'heureDebut': item.heureDebut,
                  'heureFin': item.heureFin,
                  'name': item.name,
                  'calorie': item.calorie,
                  'step': item.step,
                  'typeActivite': item.typeActivite,
                  'distance': item.distance,
                  'minuteActive': item.minuteActive,
                  'duree': item.duree,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'idParticipant': item.idParticipant
                },
            changeListener),
        _activityDeletionAdapter = DeletionAdapter(
            database,
            'Activity',
            ['id'],
            (Activity item) => <String, dynamic>{
                  'id': item.id,
                  'remoteId': item.remoteId,
                  'dateActivity': _dateTimeConverter.encode(item.dateActivity),
                  'heureDebut': item.heureDebut,
                  'heureFin': item.heureFin,
                  'name': item.name,
                  'calorie': item.calorie,
                  'step': item.step,
                  'typeActivite': item.typeActivite,
                  'distance': item.distance,
                  'minuteActive': item.minuteActive,
                  'duree': item.duree,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'idParticipant': item.idParticipant
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Activity> _activityInsertionAdapter;

  final UpdateAdapter<Activity> _activityUpdateAdapter;

  final DeletionAdapter<Activity> _activityDeletionAdapter;

  @override
  Future<List<Activity>> getActivites() async {
    return _queryAdapter.queryList('SELECT * from activity',
        mapper: (Map<String, dynamic> row) => Activity(
            id: row['id'] as int,
            remoteId: row['remoteId'] as int,
            dateActivity: _dateTimeConverter.decode(row['dateActivity'] as int),
            heureDebut: row['heureDebut'] as int,
            heureFin: row['heureFin'] as int,
            name: row['name'] as String,
            calorie: row['calorie'] as double,
            step: row['step'] as int,
            typeActivite: row['typeActivite'] as int,
            distance: row['distance'] as double,
            minuteActive: row['minuteActive'] as int,
            duree: row['duree'] as int,
            latitude: row['latitude'] as double,
            longitude: row['longitude'] as double,
            idParticipant: row['idParticipant'] as int));
  }

  @override
  Stream<List<Activity>> watchActivities() {
    return _queryAdapter.queryListStream('SELECT * from activity',
        queryableName: 'Activity',
        isView: false,
        mapper: (Map<String, dynamic> row) => Activity(
            id: row['id'] as int,
            remoteId: row['remoteId'] as int,
            dateActivity: _dateTimeConverter.decode(row['dateActivity'] as int),
            heureDebut: row['heureDebut'] as int,
            heureFin: row['heureFin'] as int,
            name: row['name'] as String,
            calorie: row['calorie'] as double,
            step: row['step'] as int,
            typeActivite: row['typeActivite'] as int,
            distance: row['distance'] as double,
            minuteActive: row['minuteActive'] as int,
            duree: row['duree'] as int,
            latitude: row['latitude'] as double,
            longitude: row['longitude'] as double,
            idParticipant: row['idParticipant'] as int));
  }

  @override
  Future<Activity> getActivity(int id) async {
    return _queryAdapter.query('SELECT * from activity where id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Activity(
            id: row['id'] as int,
            remoteId: row['remoteId'] as int,
            dateActivity: _dateTimeConverter.decode(row['dateActivity'] as int),
            heureDebut: row['heureDebut'] as int,
            heureFin: row['heureFin'] as int,
            name: row['name'] as String,
            calorie: row['calorie'] as double,
            step: row['step'] as int,
            typeActivite: row['typeActivite'] as int,
            distance: row['distance'] as double,
            minuteActive: row['minuteActive'] as int,
            duree: row['duree'] as int,
            latitude: row['latitude'] as double,
            longitude: row['longitude'] as double,
            idParticipant: row['idParticipant'] as int));
  }

  @override
  Future<Activity> getActivityByRemote(int remoteId) async {
    return _queryAdapter.query('SELECT * from activity where remoteId = ?',
        arguments: <dynamic>[remoteId],
        mapper: (Map<String, dynamic> row) => Activity(
            id: row['id'] as int,
            remoteId: row['remoteId'] as int,
            dateActivity: _dateTimeConverter.decode(row['dateActivity'] as int),
            heureDebut: row['heureDebut'] as int,
            heureFin: row['heureFin'] as int,
            name: row['name'] as String,
            calorie: row['calorie'] as double,
            step: row['step'] as int,
            typeActivite: row['typeActivite'] as int,
            distance: row['distance'] as double,
            minuteActive: row['minuteActive'] as int,
            duree: row['duree'] as int,
            latitude: row['latitude'] as double,
            longitude: row['longitude'] as double,
            idParticipant: row['idParticipant'] as int));
  }

  @override
  Future<Activity> getActivityByParticipant(int idParticipant) async {
    return _queryAdapter.query('SELECT * from activity where idParticipant = ?',
        arguments: <dynamic>[idParticipant],
        mapper: (Map<String, dynamic> row) => Activity(
            id: row['id'] as int,
            remoteId: row['remoteId'] as int,
            dateActivity: _dateTimeConverter.decode(row['dateActivity'] as int),
            heureDebut: row['heureDebut'] as int,
            heureFin: row['heureFin'] as int,
            name: row['name'] as String,
            calorie: row['calorie'] as double,
            step: row['step'] as int,
            typeActivite: row['typeActivite'] as int,
            distance: row['distance'] as double,
            minuteActive: row['minuteActive'] as int,
            duree: row['duree'] as int,
            latitude: row['latitude'] as double,
            longitude: row['longitude'] as double,
            idParticipant: row['idParticipant'] as int));
  }

  @override
  Future<void> length() async {
    await _queryAdapter.queryNoReturn('Select count(*) from activity');
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('Delete from activity');
  }

  @override
  Future<void> deleteByRemote(int remoteId) async {
    await _queryAdapter.queryNoReturn('Delete from activity where remoteId = ?',
        arguments: <dynamic>[remoteId]);
  }

  @override
  Future<int> insertActivity(Activity activity) {
    return _activityInsertionAdapter.insertAndReturnId(
        activity, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateActivity(Activity activity) {
    return _activityUpdateAdapter.updateAndReturnChangedRows(
        activity, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteActivity(Activity activity) async {
    await _activityDeletionAdapter.delete(activity);
  }
}

class _$TypeActivityDao extends TypeActivityDao {
  _$TypeActivityDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _typeActivityInsertionAdapter = InsertionAdapter(
            database,
            'TypeActivity',
            (TypeActivity item) => <String, dynamic>{
                  'id': item.id,
                  'remoteId': item.remoteId,
                  'nom': item.nom,
                  'numero': item.numero
                },
            changeListener),
        _typeActivityUpdateAdapter = UpdateAdapter(
            database,
            'TypeActivity',
            ['id'],
            (TypeActivity item) => <String, dynamic>{
                  'id': item.id,
                  'remoteId': item.remoteId,
                  'nom': item.nom,
                  'numero': item.numero
                },
            changeListener),
        _typeActivityDeletionAdapter = DeletionAdapter(
            database,
            'TypeActivity',
            ['id'],
            (TypeActivity item) => <String, dynamic>{
                  'id': item.id,
                  'remoteId': item.remoteId,
                  'nom': item.nom,
                  'numero': item.numero
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TypeActivity> _typeActivityInsertionAdapter;

  final UpdateAdapter<TypeActivity> _typeActivityUpdateAdapter;

  final DeletionAdapter<TypeActivity> _typeActivityDeletionAdapter;

  @override
  Future<List<TypeActivity>> getTypeActivities() async {
    return _queryAdapter.queryList('SELECT * from typeActivity',
        mapper: (Map<String, dynamic> row) => TypeActivity(
            id: row['id'] as int,
            remoteId: row['remoteId'] as int,
            nom: row['nom'] as String,
            numero: row['numero'] as int));
  }

  @override
  Stream<List<TypeActivity>> watchTypeActivities() {
    return _queryAdapter.queryListStream('SELECT * from typeActivity',
        queryableName: 'TypeActivity',
        isView: false,
        mapper: (Map<String, dynamic> row) => TypeActivity(
            id: row['id'] as int,
            remoteId: row['remoteId'] as int,
            nom: row['nom'] as String,
            numero: row['numero'] as int));
  }

  @override
  Future<TypeActivity> getTypeActivity(int id) async {
    return _queryAdapter.query('SELECT * from typeActivity where id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => TypeActivity(
            id: row['id'] as int,
            remoteId: row['remoteId'] as int,
            nom: row['nom'] as String,
            numero: row['numero'] as int));
  }

  @override
  Future<TypeActivity> getTypeActivityByRemote(int remoteId) async {
    return _queryAdapter.query('SELECT * from typeActivity where remoteId = ?',
        arguments: <dynamic>[remoteId],
        mapper: (Map<String, dynamic> row) => TypeActivity(
            id: row['id'] as int,
            remoteId: row['remoteId'] as int,
            nom: row['nom'] as String,
            numero: row['numero'] as int));
  }

  @override
  Future<void> length() async {
    await _queryAdapter.queryNoReturn('Select count(*) from typeActivity');
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('Delete from typeActivity');
  }

  @override
  Future<void> deleteByRemote(int remoteId) async {
    await _queryAdapter.queryNoReturn(
        'Delete from typeActivity where remoteId = ?',
        arguments: <dynamic>[remoteId]);
  }

  @override
  Future<int> insertParticipant(TypeActivity typeActivity) {
    return _typeActivityInsertionAdapter.insertAndReturnId(
        typeActivity, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateParticipant(TypeActivity typeActivity) {
    return _typeActivityUpdateAdapter.updateAndReturnChangedRows(
        typeActivity, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteParticipant(TypeActivity typeActivity) async {
    await _typeActivityDeletionAdapter.delete(typeActivity);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
