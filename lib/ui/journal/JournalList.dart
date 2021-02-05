import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:marche_a_pied/i18n/AppLocalizations.dart';
import 'package:marche_a_pied/models/Activity.dart';
import 'package:marche_a_pied/stream/StreamerCustom.dart';
import 'package:marche_a_pied/widget/CustomFloatingActionButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class JournalList extends StatefulWidget {

  @override
  _JournalListState createState() => _JournalListState();
}

class _JournalListState extends State<JournalList> {
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        progressIndicator: CircularProgressIndicator(),
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      onPressed: () async {
                        setState(() => _saving = true);
                        await Future.delayed(Duration(seconds: 2));
                        setState(() => _saving = false);
                      },
                      icon: Icon(Icons.sync),
                      tooltip: AppLocalizations.of(context).translate("refresh"),
                    )
                  ],
                  expandedHeight: 100.0,
                  floating: false,
                  pinned: true,
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    title: Text(AppLocalizations.of(context).translate("journal")),
                  ),
                ),
              ];
            },
            body: Center(
              child: StreamBuilder<List<Activity>>(
                  stream: StreamerCustom(null)
                      .allActivityStream(1),
                  builder: (context, snapshot) {
                    final List<Activity> activities =
                        snapshot.hasData ? snapshot.data : List();
                    return GroupedListView<Activity, String>(
                      elements: activities,
                      order: GroupedListOrder.DESC,
                      groupBy: (activity) {
                        DateFormat frmt = DateFormat("EEE, dd MMM yyyy");
                        return frmt.format(activity.dateActivity);
                      },
                      groupSeparatorBuilder: (String dateActi) =>
                          ActivityGroupSeparator(
                        dateAct: dateActi,
                        steps: 7000,
                        allAct: activities,
                      ),
                      itemBuilder: (context, Activity act) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/detailjournal',
                                arguments: act);
                          },
                          child: ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${act.heureDebutRemote.split(".")[0]}",
                                  style: TextStyle(fontSize: 11),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 5.0),
                                  child: Text("${act.applyName()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            trailing: CircleAvatar(
                              child: Icon(
                                OMIcons.directionsWalk,
                              ),
                            ),
                            subtitle: Text(
                                "${act.distance} km ${AppLocalizations.of(context).translate("in")} ${act.minuteActive}"),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}

class ActivityGroupSeparator extends StatelessWidget {
  final String dateAct;
  final int steps;
  final List<Activity> allAct;
  int steptotal = 0;

  ActivityGroupSeparator({this.dateAct, this.steps, this.allAct});

  @override
  Widget build(BuildContext context) {
    var internMap = groupBy<Activity, DateTime>(allAct, (obj) {
      return obj.dateActivity;
    });

    internMap.forEach((DateTime dateTime, List<Activity> value) {
      value.forEach((element) {
        String elementDate =
            element.dateActivity.toString().split(" ").elementAt(0);
        if (dateAct == elementDate) {
          steptotal += element.step;
        }
      });
    });

    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 3,
                child: Text(
                  "${dateAct}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "$steptotal",
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        Divider()
      ],
    ));
  }
}
