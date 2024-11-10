import 'package:crime_net/pages/home_page.dart';
import 'package:crime_net/pages/reported_crimes_form.dart';
import 'package:crime_net/pages/reported_crimes_list.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget body;
  final String title;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  BasePage({super.key, required this.body, this.title = "Título"});

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
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Crime-net"),
            ),
            ListTile(
              title: const Text("Página inicial"),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              title: const Text("Crimes reportados"),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const ReportedCrimesPage()),
                );
              },
            ),
            ListTile(
              title: const Text("Reportar crime"),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const ReportedCrimesForm()),
                );
              },
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
