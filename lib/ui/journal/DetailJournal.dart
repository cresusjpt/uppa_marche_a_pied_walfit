import 'package:flutter/material.dart';
import 'package:marche_a_pied/i18n/AppLocalizations.dart';
import 'package:marche_a_pied/models/Activity.dart';

class DetailJournal extends StatefulWidget {
  @override
  _DetailJournalState createState() => _DetailJournalState();
}

class _DetailJournalState extends State<DetailJournal> {
  Map data = {};
  Activity currentActivity;

  @override
  Widget build(BuildContext context) {
    if(data.isEmpty){
      currentActivity = ModalRoute.of(context).settings.arguments;
    }

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          title: Text("${currentActivity.name}"),
        ),
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.edit_outlined),
            tooltip: AppLocalizations.of(context).translate("edit"),
          ),
          IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.share_outlined),
            tooltip: AppLocalizations.of(context).translate("share"),
          ),
          IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.delete_outline_outlined),
            tooltip: AppLocalizations.of(context).translate("delete"),
          ),
        ],
      ),

      body: Container(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                  child: Text("${AppLocalizations.of(context).translate("steps")} : ${currentActivity.step}"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Row(
                        children: [
                          Icon(Icons.my_location),
                          Text("Distance",)
                        ],
                      )
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("${currentActivity.distance} km",textAlign: TextAlign.end,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Row(
                        children: [
                          Icon(Icons.local_fire_department_outlined),
                          Text("Calories",)
                        ],
                      )
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("${currentActivity.calorie}",textAlign: TextAlign.end,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Row(
                        children: [
                          Icon(Icons.space_bar_outlined),
                          Text(AppLocalizations.of(context).translate("duration"))
                        ],
                      )
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("${currentActivity.minuteActive}",textAlign: TextAlign.end,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Row(
                        children: [
                          Icon(Icons.speed_outlined),
                          Text(AppLocalizations.of(context).translate("pace"))
                        ],
                      )
                    ),
                    Flexible(
                      flex: 1,
                      child: Text("19:15/km",textAlign: TextAlign.end,),
                    ),
                  ],
                ),
              ),
              //Divider()
            ],
          )
      ),
    );
  }
}
