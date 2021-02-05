import 'package:flutter/material.dart';
import 'package:marche_a_pied/i18n/AppLocalizations.dart';
import 'package:preferences/preferences.dart';

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
                    tooltip: AppLocalizations.of(context).translate("refresh"),
                  )
                ],
                expandedHeight: 100.0,
                floating: false,
                pinned: true,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  title: Text(AppLocalizations.of(context).translate("profile")),
                ),
              ),
            ];
          },
          body: Center(
            child: PreferencePage([
              PreferenceTitle(AppLocalizations.of(context).translate("act_goals")),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      AppLocalizations.of(context).translate("steps"),
                      'profile_steps',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      AppLocalizations.of(context).translate("name"),
                      'profile_user_display_name',
                    ),
                  ),
                ],
              ),
              PreferenceTitle(AppLocalizations.of(context).translate("about")),
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
                      AppLocalizations.of(context).translate("weigth"),
                      'profil_weight_value',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      AppLocalizations.of(context).translate("heigth"),
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
                      AppLocalizations.of(context).translate("day"),
                      'profile_birth_day',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      AppLocalizations.of(context).translate("month"),
                      'profile_birth_month',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFieldPreference(
                      AppLocalizations.of(context).translate("year"),
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
