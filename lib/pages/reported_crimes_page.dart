import 'package:flutter/material.dart';

class ReportedCrimesPage extends StatelessWidget {
  const ReportedCrimesPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          onPressed: null,
          icon: Icon(Icons.menu),
        ),
        title: const Text("Crimes reportados"),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: "Pesquisar",
          )
        ],
      ),
      body: const Center(
        child: Text("Tela de crimes reportados"),
      ),
    );
  }
}