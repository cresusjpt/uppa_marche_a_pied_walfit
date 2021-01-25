import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:marche_a_pied/main.dart';
import 'package:marche_a_pied/models/Activity.dart';
import 'package:marche_a_pied/styles/AppTheme.dart';
import 'package:marche_a_pied/widget/CustomFloatingActionButton.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class JournalList extends StatefulWidget {
  List<Activity> activities = Activity().bindData();

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
            child: GroupedListView<Activity, String>(
              elements: widget.activities,
              order: GroupedListOrder.DESC,
              groupBy: (activity){
                return activity.dateActivity;
              },
              groupSeparatorBuilder: (String dateActi)=> ActivityGroupSeparator(dateAct: dateActi,steps: 7000),
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
                        Text("${act.timeStart}",style: TextStyle(fontSize: 11),),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0,bottom: 5.0),
                          child: Text("${act.name}",style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    trailing: CircleAvatar(
                      child: Icon(OMIcons.directionsWalk,),
                    ),
                    subtitle: Text("${act.km} km in ${act.duration}"),
                  ),
                );
              },
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
  ActivityGroupSeparator({this.dateAct,this.steps});

  @override
  Widget build(BuildContext context) {
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
                  child: Text("$steps",textAlign: TextAlign.end,),
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
