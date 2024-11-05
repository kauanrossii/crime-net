import 'package:crime_net/pages/reported_crimes_page.dart';
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
        title: const Text("Texto de exemplo"),
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
            )
          ],
        ),
      ),
      body: const Center(
        child: Text("Tela inicial"),
      ),
    );
  }
}
