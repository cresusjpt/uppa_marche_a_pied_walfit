import 'package:flutter/material.dart';
import 'package:marche_a_pied/keys/Assets.dart';

class Logo extends StatelessWidget {
  final double size;

  const Logo({Key key, this.size = 100.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Asset.LOGO",
      child: Image.asset(
        Asset.LOGO,
        width: size,
        semanticLabel: "Logo",
      ),
    );
  }
}