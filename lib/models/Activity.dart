class Activity {
  String dateActivity;
  String timeStart;
  String name;
  double km;
  String duration;
  String typeActivity;
  double calorie;
  int steps;

  Activity(
      {this.dateActivity, this.timeStart, this.name, this.km, this.duration, this.typeActivity,
        this.calorie, this.steps});

  List<Activity> bindData() {
    List<Activity> ret = List();

    Activity act0 = Activity(
      dateActivity: "Sat, 19 Dec",
      timeStart: "19:48",
      name: "Evening walk",
      km: 3.18,
      duration: "48 min",
      typeActivity: "walk",
      calorie: 215,
      steps: 4334
    );
    Activity act1 = Activity(
      dateActivity: "Sat, 19 Dec",
      timeStart: "18:35",
      name: "Evening walk",
      km: 0.7,
      duration: "13 min",
      typeActivity: "walk",
      calorie: 61,
      steps: 992
    );

    Activity act2 = Activity(
        dateActivity: "Wed, 16 Dec",
        timeStart: "11:20",
        name: "Lunch walk",
        km: 1.13,
        duration: "1h 7",
        typeActivity: "walk",
        calorie: 208,
        steps: 1667);

    Activity act3 = Activity(
        dateActivity: "Wed, 16 Dec",
        timeStart: "11:20",
        name: "Morning walk",
        km: 1.13,
        duration: "1h 7",
        typeActivity: "walk",
        calorie: 208,
        steps: 1667);

    Activity act4 = Activity(
        dateActivity: "Mon, 14 Dec",
        timeStart: "11:20",
        name: "Afternoon walk",
        km: 7.25,
        duration: "1h 7",
        typeActivity: "walk",
        calorie: 297,
        steps: 8722);


    ret.add(act0);
    ret.add(act1);
    ret.add(act2);
    ret.add(act3);
    ret.add(act4);
    ret.add(act4);
    ret.add(act4);
    ret.add(act4);

    return ret;
  }
}