import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:marche_a_pied/i18n/AppLanguage.dart';
import 'package:marche_a_pied/keys/Url.dart';
import 'package:marche_a_pied/utils/Functions.dart';
import 'package:marche_a_pied/utils/http/HttpRequest.dart';
/*
import 'package:univagenda/keys/url.dart';
 */

class ChangeLog extends StatelessWidget {
  Future<String> _fetchData(BuildContext context) async {
    String currentlang =  await AppLanguage().currentLanguage();
    final response = await HttpRequest.get(
      currentlang == "fr" ? Url.changelogFr : Url.changelog,
    );
    if (response.isSuccess) return response.httpResponse.body;
    return "## **NETWORK ERROR**";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _fetchData(context),
      builder: (_, snapshot) => (snapshot.hasData)
          ? Markdown(
          data: snapshot.data,
          onTapLink: ( text, href, title) => openLink(null, href, null))
          : const Center(child: CircularProgressIndicator()),
    );
  }
}