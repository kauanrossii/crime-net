import 'package:crime_net/components/list_features.dart';
import 'package:crime_net/pages/reported_crimes_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: const Text("Página inicial"),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: "Pesquisar",
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Crime-net"),
            ),
            const ListTile(
              title: Text("Página inicial"),
            ),
            ListTile(
              title: const Text("Crimes reportados"),
              onTap: () {
                Navigator.of(scaffoldKey.currentContext!).push(
                  MaterialPageRoute(
                    builder: (context) => const ReportedCrimesPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Reportar crime"),
              onTap: () {
                Navigator.of(scaffoldKey.currentContext!).push(
                  MaterialPageRoute(
                    builder: (context) => const ReportedCrimesPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
