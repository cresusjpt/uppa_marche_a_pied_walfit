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
          headerSliverBuilder: (context, isScrolled) {
            return <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/settings");
                    },
                    icon: Icon(Icons.settings),
                    tooltip: "deactivate_diffuser",
                  )
                ],
                expandedHeight: 100.0,
                floating: false,
                pinned: true,
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
                      'profile_steps',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      'Name',
                      'profile_user_display_name',
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
                    child: DropdownPreference<String>(
                      '',
                      'profil_gender',
                      defaultVal: "masculin",
                      displayValues: ['Male', 'Female'],
                      values: ["masculin", "feminin"],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      'Weight',
                      'profil_weight_value',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      'Height',
                      'profile_height_value',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              PreferenceText('Birthday'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      'Day',
                      'profile_birth_day',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      'Month',
                      'profile_birth_month',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      'Year',
                      'profile_birth_year',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Divider(),
              Center(
                child: InkWell(
                  onTap: () {
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
