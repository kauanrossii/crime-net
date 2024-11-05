import 'package:flutter/material.dart';

class ReportedCrimesForm extends StatelessWidget {
  const ReportedCrimesForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          onPressed: null,
          icon: Icon(Icons.menu),
        ),
        title: const Text("Reportar crime"),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: "Pesquisar",
          )
        ],
      ),
      body: const Center(
        child: Text("Página de cadastro de crimes"),
      ),
    );
  }
}
