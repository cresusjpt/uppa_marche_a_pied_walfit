import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:marche_a_pied/models/Activity.dart';
import 'package:marche_a_pied/stream/StreamerCustom.dart';
import 'package:marche_a_pied/widget/CustomFloatingActionButton.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class JournalList extends StatefulWidget {
  //final List<Activity> activities = Activity().bindData();

  @override
  _JournalListState createState() => _JournalListState();
}

class _JournalListState extends State<JournalList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled){
            return <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  IconButton(
                    onPressed: (){
                    },
                    icon: Icon(Icons.sync),
                    tooltip: "deactivate_diffuser",
                  )
                ],
                expandedHeight: 100.0,
                floating: false,
                pinned : true,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  title: Text("Journal"),
                ),
              ),
              /*SliverFillRemaining(
                child: ,
              )*/
            ];
          },
          body: Center(
            child: StreamBuilder<List<Activity>>(
              stream: StreamerCustom("http://10.0.2.2:8080").allActivityStream(1),
              builder: (context, snapshot) {
                final List<Activity> activities = snapshot.hasData ? snapshot.data : List();
                return GroupedListView<Activity, String>(
                  elements: activities,
                  order: GroupedListOrder.DESC,
                  groupBy: (activity){
                    return activity.dateActivity.toString().split(" ").elementAt(0);
                  },
                  groupSeparatorBuilder: (String dateActi)=> ActivityGroupSeparator(dateAct: dateActi,steps: 7000,allAct: activities,),
                  itemBuilder: (context, Activity act){
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/detailjournal',arguments: act);
                      },
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${act.heureDebutRemote.split(".")[0]}",style: TextStyle(fontSize: 11),),
                            Padding(
                              padding: const EdgeInsets.only(top:8.0,bottom: 5.0),
                              child: Text("${act.applyName()}",style: TextStyle(fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        trailing: CircleAvatar(
                          child: Icon(OMIcons.directionsWalk,),
                        ),
                        subtitle: Text("${act.distance} km in ${act.minuteActive}"),
                      ),
                    );
                  },
                );
              }
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
  ActivityGroupSeparator({this.dateAct,this.steps,this.allAct});

  @override
  Widget build(BuildContext context) {

    var internMap = groupBy<Activity,  DateTime>(allAct, (obj) {
      return obj.dateActivity;
    });

    internMap.forEach((DateTime dateTime, List<Activity> value) {
      value.forEach((element) {
        String elementDate = element.dateActivity.toString().split(" ").elementAt(0);
        if(dateAct == elementDate){
          steptotal+=element.step;
        }
      });
    });

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  flex: 3,
                  child: Text("$dateAct",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                ),
                Flexible(
                  flex: 1,
                  child: Text("$steptotal",textAlign: TextAlign.end,),
                ),
              ],
            ),
          ),
          Divider()
        ],
      )
    );
  }
}
