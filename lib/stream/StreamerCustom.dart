import 'package:marche_a_pied/models/Activity.dart';
import 'package:marche_a_pied/network/RestApi.dart';

class StreamerCustom {
  final String url;

  StreamerCustom(this.url);

  Stream<List<Activity>> todayActivityStream(int idParticipant) async* {
    while (true) {
      List<Activity> activities =
          await RestApi.createClient(url: this.url).today(idParticipant);
      yield activities;
      await Future.delayed(Duration(seconds: 10));
    }
  }

  Stream<List<Activity>> byDateActivityStream(
      String date, int idParticipant) async* {
    while (true) {
      List<Activity> activities =
          await RestApi.createClient(url: this.url).byDate(date, idParticipant);
      yield activities;
      await Future.delayed(Duration(minutes: 10));
    }
  }

  Stream<List<Activity>> allActivityStream(int idParticipant) async* {
    while (true) {
      List<Activity> activities =
          await RestApi.createClient(url: this.url).all(idParticipant);
      yield activities;
      await Future.delayed(Duration(minutes: 5));
    }
  }

  Stream<List<Activity>> pastWeekActivityStream(int idParticipant) async* {
    while (true) {
      List<Activity> activities =
          await RestApi.createClient(url: this.url).pastWeek(idParticipant);
      yield activities;
      await Future.delayed(Duration(minutes: 1));
    }
  }

  Stream<List<Activity>> intervallDaysActivityStream(
      String last, String first, int idParticipant) async* {
    while (true) {
      List<Activity> activities = await RestApi.createClient(url: this.url)
          .intervallDays(last, first, idParticipant);
      yield activities;
      await Future.delayed(Duration(minutes: 3));
    }
  }

  Stream<List<Activity>> monthActivityStream(
      String last, String first, int idParticipant) async* {
    while (true) {
      List<Activity> activities = await RestApi.createClient(url: this.url)
          .month(last, first, idParticipant);
      yield activities;
      await Future.delayed(Duration(minutes: 5));
    }
  }
}
