import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:validators/validators.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                      Navigator.pushNamed(context, "/settings");
                    },
                    icon: Icon(Icons.settings),
                    tooltip: "deactivate_diffuser",
                  )
                ],
                expandedHeight: 100.0,
                floating: false,
                pinned : true,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  title: Text("Profile"),
                ),
              ),
            ];
          },
          body: Center(
            child: PreferencePage([
              PreferenceTitle('Activity goals'),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      'Steps',
                      'stems',
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      'Name',
                      'user_display_name',
                    ),
                  ),
                ],
              ),
              PreferenceTitle('About you'),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      'Gender',
                      'gender',
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      'Weight',
                      'weight_value',
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      'Height',
                      'height_value',
                    ),
                  ),
                ],
              ),
              PreferenceText('Bithday'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      'Day',
                      'gender',
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      'Month',
                      'month_value',
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      'Year',
                      'year_value',
                    ),
                  ),
                ],
              ),
              DropdownPreference<int>(
                'Number of items',
                'items_count',
                defaultVal: 2,
                displayValues: ['One', 'Two', 'Three', 'Four'],
                values: [1, 2, 3, 4],
              ),
              Divider(),
              Center(
                child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/about");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text("© M1 SIGLIS, UPPA 2020 - 2021"),
                    ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
