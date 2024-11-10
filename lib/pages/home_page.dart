import 'package:crime_net/components/list_features.dart';
import 'package:crime_net/pages/base_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Página inicial",
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: const ListFeatures()),
        ),
      ),
    );
  }
}
