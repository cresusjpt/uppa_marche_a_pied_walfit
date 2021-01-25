import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:validators/validators.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SafeArea(
        child: Center(
          child: PreferencePage([
            PreferenceTitle('Units'),
            PreferenceDialogLink(
              'Weight',
              desc: "Kilometers",
              dialog: PreferenceDialog(
                [
                  RadioPreference('Kilograms', 'select_1', 'weight_radio'),
                  RadioPreference('Stones', 'select_2', 'weight_radio'),
                  RadioPreference('Pounds', 'select_3', 'weight_radio'),
                ],
                title: 'Weight',
                cancelText: 'Cancel',
              ),
            ),
            PreferenceDialogLink(
              'Distance',
              desc: "Kilometers",
              dialog: PreferenceDialog(
                [
                  RadioPreference('Kilometers', 'select_1', 'distance_radio'),
                  RadioPreference('Miles', 'select_2', 'distance_radio'),
                ],
                title: 'Distance',
                cancelText: 'Cancel',
              ),
            ),
            PreferenceDialogLink(
              'Energy',
              desc: "Calories",
              dialog: PreferenceDialog(
                [
                  RadioPreference('Calories', 'select_1', 'energy_radio'),
                  RadioPreference('Kilojoules', 'select_2', 'energy_radio'),
                ],
                title: 'Distance',
                cancelText: 'Cancel',
              ),
            ),
            PreferenceTitle('Notifications'),
            PreferencePageLink(
              'Notifications',
              trailing: Icon(Icons.keyboard_arrow_right),
              page: PreferencePage([
                PreferenceTitle('New Posts'),
                SwitchPreference(
                  'New Posts from Friends',
                  'notification_newpost_friend',
                  defaultVal: true,
                ),
                PreferenceTitle('Private Messages'),
                SwitchPreference(
                  'Private Messages from Friends',
                  'notification_pm_friend',
                  defaultVal: true,
                ),
                SwitchPreference(
                  'Private Messages from Strangers',
                  'notification_pm_stranger',
                  onEnable: () async {
                    // Write something in Firestore or send a request
                    await Future.delayed(Duration(seconds: 1));

                    print('Enabled Notifications for PMs from Strangers!');
                  },
                  onDisable: () async {
                    // Write something in Firestore or send a request
                    await Future.delayed(Duration(seconds: 1));

                    // No Connection? No Problem! Just throw an Exception with your custom message...
                    throw Exception('No Connection');

                    // Disabled Notifications for PMs from Strangers!
                  },
                ),
              ]),
            ),
            PreferenceTitle('Privacy'),
            PreferencePageLink(
              'Data usage & manage',
              trailing: Icon(Icons.keyboard_arrow_right),
              page: PreferencePage([
                PreferenceTitle('New Posts'),
                SwitchPreference(
                  'New Posts from Friends',
                  'notification_newpost_friend',
                  defaultVal: true,
                ),
                PreferenceTitle('Private Messages'),
                SwitchPreference(
                  'Private Messages from Friends',
                  'notification_pm_friend',
                  defaultVal: true,
                ),
                SwitchPreference(
                  'Private Messages from Strangers',
                  'notification_pm_stranger',
                  onEnable: () async {
                    // Write something in Firestore or send a request
                    await Future.delayed(Duration(seconds: 1));

                    print('Enabled Notifications for PMs from Strangers!');
                  },
                  onDisable: () async {
                    // Write something in Firestore or send a request
                    await Future.delayed(Duration(seconds: 1));

                    // No Connection? No Problem! Just throw an Exception with your custom message...
                    throw Exception('No Connection');

                    // Disabled Notifications for PMs from Strangers!
                  },
                ),
              ]),
            ),
            SwitchPreference(
              'Use your location',
              'use_location',
              desc:
                  'Use background location during automatically tracked activities',
            ),//// Use ! to get reversed boolean values
            PreferenceTitle('Display'),
            RadioPreference(
              'System default',
              'system_theme',
              'ui_theme',
              isDefault: true,
              selected: true,
              onSelect: () {
                //DynamicTheme.of(context).setBrightness(Brightness.light);
              },
            ),
            RadioPreference(
              'Light Theme',
              'light_theme',
              'ui_theme',
              onSelect: () {
                //DynamicTheme.of(context).setBrightness(Brightness.light);
              },
            ),
            RadioPreference(
              'Dark Theme',
              'dark_theme',
              'ui_theme',
              onSelect: () {
                //DynamicTheme.of(context).setBrightness(Brightness.dark);
              },
            ),
          ]),
        ),
      ),
    );
  }
}
