import 'dart:async';

import 'package:floor/floor.dart';
import 'package:marche_a_pied/models/Participant.dart';

@dao
abstract class ActiviteDao{

  @Query("SELECT * from participant")
  Future<List<Participant>> getParticipants();

  @Query("SELECT * from participant")
  Stream<List<Participant>> watchParticipants();

  @Query("SELECT * from participant where id = :id")
  Future<Participant> getParticipant(int id);

  @Query("SELECT * from participant where remoteId = :remoteId")
  Future<Participant> getParticipantByRemote(int remoteId);

  @Query("Select count(*) from participant")
  Future<void> length();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertParticipant(Participant participant);

  @update
  Future<int> updateParticipant(Participant participant);

  @delete
  Future<void> deleteParticipant(Participant participant);

  @Query("Delete from participant")
  Future<void> deleteAll();

  @Query("Delete from participant where remoteId = :remoteId")
  Future<void> deleteByRemote(int remoteId);

}