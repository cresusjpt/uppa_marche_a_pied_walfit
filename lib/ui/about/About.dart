import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marche_a_pied/keys/Assets.dart';
import 'package:marche_a_pied/keys/Url.dart';
import 'package:marche_a_pied/utils/Functions.dart';
import 'package:marche_a_pied/widget/AboutCard.dart';
import 'package:marche_a_pied/widget/ChangeLog.dart';
import 'package:marche_a_pied/widget/CircleImage.dart';
import 'package:marche_a_pied/widget/Logo.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:package_info/package_info.dart';

class AboutScreen extends StatelessWidget {
  Widget _buildHeader(BuildContext context) {
    final txtTheme =
    Theme.of(context).textTheme.headline5.copyWith(fontSize: 30.0);
    final appName = "WalkFit";

    return Container(
      padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Logo(size: 80.0),
          ),
          Text(appName, style: txtTheme),
        ],
      ),
    );
  }

  Widget _buildWhatIsIt(BuildContext context) {
    return AboutCard(
      title: "What is it",
      children: [
        Text(
          "Application dévéloppé en gestion de projet en Master 1 Uppa",
          //style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.justify,
        )
      ],
    );
  }

  Widget _buildAuthor(BuildContext context) {
    return AboutCard(
      title: "Author",
      lateralPadding: false,
      children: [
        ListTile(
          leading: CircleImage(
            image: Image.asset(
              Asset.PICTURE_PATRICIA,
              width: 45.0,
              semanticLabel: "Photo  de Patricia N'Dong",
            ),
          ),
          title: const Text("Patricia N'Dong"),
          subtitle: Text("Lead Dev"),
          onTap: () => openLink(
            context,
            Url.myWebsite,
            ""
          ),
        ),ListTile(
          leading: CircleImage(
            image: Image.asset(
              Asset.PICTURE_JEANPAUL_TOSSOU,
              width: 45.0,
              semanticLabel: "Photo de Jeanpaul Tossou",
            ),
          ),
          title: const Text("Jeanpaul Tossou"),
          subtitle: Text("Developer"),
          onTap: () => openLink(
            context,
            Url.myWebsite,
            ""
          ),
        ),
        ListTile(
          leading: CircleImage(
            image: Image.asset(
              Asset.PICTURE_THILOR,
              width: 45.0,
              semanticLabel: "Photo Thilor Mbaye Sene",
            ),
          ),
          title: const Text("Thilor Mbaye Sene"),
          subtitle: Text("Developer",
          ),
          onTap: () => openLink(
            context,
            Url.justinWebsite,
            ""
          ),
        )
      ],
    );
  }

  Widget _buildSocial(BuildContext context) {
    final isDark = isDarkTheme(Theme.of(context).brightness);
    final store = Platform.isAndroid ? "Play Store" : "App Store";

    return AboutCard(
      title: "Social",
      lateralPadding: false,
      children: [
        ListTile(
          leading: Image.asset(
            Platform.isAndroid ? Asset.PLAYSTORE : Asset.APPSTORE,
            width: Platform.isAndroid ? 30.0 : 32.0,
            semanticLabel: store,
          ),
          title: Text(store),
          subtitle: Text("Please note the app on the store"),
          onTap: () => openLink(
            context,
            Platform.isAndroid ? Url.playstore : Url.appstore,
    ""
          ),
        ),
        ListTile(
          leading: Image.asset(
            isDark ? Asset.GITHUB_WHITE : Asset.GITHUB_DARK,
            width: 30.0,
            semanticLabel: "Logo GitHub",
          ),
          title: const Text("GitHub Project"),
          subtitle: Text("Visit the GitHub Project"),
          onTap: () => openLink(context,Url.githubProjet,
              ""),
        ),
        ListTile(
          leading: Image.asset(
            isDark ? Asset.TWITTER_WHITE : Asset.TWITTER_BLUE,
            width: 30.0,
            semanticLabel: "Logo Twitter",
          ),
          title: const Text("Twitter"),
          subtitle: Text("Ask your question on twitter"),
          onTap: () => openLink(context, Url.myTwitter, ""),
        ),
      ],
    );
  }

  String getAppInfo(PackageInfo info) {
    if (info == null) return "...";
    String str = info.version;
    if (info.buildNumber != null && info.buildNumber.isNotEmpty)
      str += " (${info.buildNumber})";
    return str;
  }

  Widget _buildOther(BuildContext context, VoidCallback onChangeLogTap,
      VoidCallback onLicensesTap) {
    return AboutCard(
      title: "Other",
      lateralPadding: false,
      children: [
        ListTile(
          title: Text("Changelog"),
          subtitle: Text("See the changelog of the app"),
          onTap: onChangeLogTap,
        ),
        ListTile(
          title: Text("Licenses"),
          subtitle: Text("Licenses details for open softwares"),
          onTap: onLicensesTap,
        ),
        ListTile(
          title: Text("Version"),
          subtitle: FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (_, snapshot) => Text(getAppInfo(snapshot.data)),
          ),
        )
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme.subtitle1;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Made with", style: txtTheme),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: const Icon(OMIcons.favorite, color: Colors.red),
          ),
        ],
      ),
    );
  }

  //It doesn't need any key , we can easily create it.
  void _modalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Changelog",
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                ),
              ),
            ),
            Expanded(child: ChangeLog())
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("About"),
        ),
        body: Container(
          child: ListView(
            children: [
              _buildHeader(context),
              _buildWhatIsIt(context),
              _buildAuthor(context),
              _buildSocial(context),
              _buildOther(
                context,
                    () => _modalBottomSheet(context),
                    () => Navigator.pushNamed(context, "/licences"),
              ),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }
}
