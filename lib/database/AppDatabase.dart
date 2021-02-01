import 'dart:async';

import 'package:floor/floor.dart';
import 'package:marche_a_pied/database/dao/ActiviteDao.dart';
import 'package:marche_a_pied/database/dao/ParticipantDao.dart';
import 'package:marche_a_pied/database/dao/TypeactiviteDao.dart';
import 'package:marche_a_pied/models/Activity.dart';
import 'package:marche_a_pied/models/DateTimeConverter.dart';
import 'package:marche_a_pied/models/Participant.dart';
import 'package:marche_a_pied/models/TypeActivity.dart';


import 'package:sqflite/sqflite.dart' as sqflite;

part 'AppDatabase.g.dart';
@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [Activity,Participant,TypeActivity])
abstract class AppDatabase extends FloorDatabase{
  ActiviteDao get activityDao;
  ParticipantDao get participantDao;
  TypeActivityDao get typeParticipantDao;
}