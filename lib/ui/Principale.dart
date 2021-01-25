import 'package:flutter/material.dart';
import 'package:marche_a_pied/ui/activities/ActivitiesList.dart';
import 'package:marche_a_pied/ui/journal/JournalList.dart';
import 'package:marche_a_pied/ui/profile/Profile.dart';
import 'package:marche_a_pied/widget/CustomFloatingActionButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Principale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrincipalStatefulWidget();
  }
}

class PrincipalStatefulWidget extends StatefulWidget {
  PrincipalStatefulWidget({Key key}) : super(key: key);

  @override
  _PrincipalStatefulWidgetState createState() => _PrincipalStatefulWidgetState();
}

class _PrincipalStatefulWidgetState extends State<PrincipalStatefulWidget> {
  int _selectedIndex = 0;
  bool _saving = false;
  final key = GlobalKey<ScaffoldState>();

  static List<Widget> _widgetOptions = <Widget>[
    ActivitiesList(),
    JournalList(),
    Profile(),
  ];

  @override
  void initState() {
    super.initState();
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,

      /*appBar: AppBar(
        title: const Text("Marche à pieds"),
        elevation: 0,
      ),*/
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        dismissible: false,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Color(0xFFE77834),
        ),
        child: Container(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap:  _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: "Journal"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"
          )
        ],
      ),
    );
  }
}


