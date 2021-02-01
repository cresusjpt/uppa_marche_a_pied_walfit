import 'dart:async';

import 'package:marche_a_pied/models/Activity.dart';
import 'package:marche_a_pied/models/Participant.dart';

class DetailInheritedWidgetData{
  List<Activity> listActivities;
  Participant participant;
  DateTime dateTime;

  final StreamController<DateTime> _streamController = StreamController.broadcast();

  Stream<DateTime> get stream => _streamController.stream;

  Sink<DateTime> get sink => _streamController.sink;

  DetailInheritedWidgetData({this.listActivities, this.dateTime});
}