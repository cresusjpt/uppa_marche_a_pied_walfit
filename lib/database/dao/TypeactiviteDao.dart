import 'dart:async';

import 'package:floor/floor.dart';
import 'package:marche_a_pied/models/TypeActivity.dart';

@dao
abstract class TypeActivityDao{

  @Query("SELECT * from typeActivity")
  Future<List<TypeActivity>> getTypeActivities();

  @Query("SELECT * from typeActivity")
  Stream<List<TypeActivity>> watchTypeActivities();

  @Query("SELECT * from typeActivity where id = :id")
  Future<TypeActivity> getTypeActivity(int id);

  @Query("SELECT * from typeActivity where remoteId = :remoteId")
  Future<TypeActivity> getTypeActivityByRemote(int remoteId);

  @Query("Select count(*) from typeActivity")
  Future<void> length();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertParticipant(TypeActivity typeActivity);

  @update
  Future<int> updateParticipant(TypeActivity typeActivity);

  @delete
  Future<void> deleteParticipant(TypeActivity typeActivity);

  @Query("Delete from typeActivity")
  Future<void> deleteAll();

  @Query("Delete from typeActivity where remoteId = :remoteId")
  Future<void> deleteByRemote(int remoteId);

}