import 'dart:async';

import 'package:floor/floor.dart';
import 'package:marche_a_pied/models/Activity.dart';

@dao
abstract class ParticipantDao{

  @Query("SELECT * from activity")
  Future<List<Activity>> getActivites();

  @Query("SELECT * from activity")
  Stream<List<Activity>> watchActivities();

  @Query("SELECT * from activity where id = :id")
  Future<Activity> getActivity(int id);

  @Query("SELECT * from activity where remoteId = :remoteId")
  Future<Activity> getActivityByRemote(int remoteId);

  @Query("SELECT * from activity where idParticipant = :idParticipant")
  Future<Activity> getActivityByParticipant(int idParticipant);

  @Query("Select count(*) from activity")
  Future<void> length();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertActivity(Activity activity);

  @update
  Future<int> updateActivity(Activity activity);

  @delete
  Future<void> deleteActivity(Activity activity);

  @Query("Delete from activity")
  Future<void> deleteAll();

  @Query("Delete from activity where remoteId = :remoteId")
  Future<void> deleteByRemote(int remoteId);

}