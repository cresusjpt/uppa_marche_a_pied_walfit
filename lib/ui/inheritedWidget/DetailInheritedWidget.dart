import 'package:flutter/cupertino.dart';
import 'package:marche_a_pied/ui/inheritedWidget/DetailInheritedWidgetData.dart';

class DetailInheritedWidget extends InheritedWidget{
  final DetailInheritedWidgetData data;

  DetailInheritedWidget({
    Key key,
    this.data,
    @required Widget child
  }): assert (child != null),
  super(key: key,child: child);

  static DetailInheritedWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<DetailInheritedWidget>();
  }

  @override
  bool updateShouldNotify(DetailInheritedWidget oldWidget) => true;
}