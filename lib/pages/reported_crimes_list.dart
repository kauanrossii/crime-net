import 'package:crime_net/components/list_reported_crimes.dart';
import 'package:crime_net/domain/services/reported_crime_service.dart';
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
      body: Center(
        child: ListReportedCrimes(reportedCrimeService: ReportedCrimeService())
      ),
    );
  }
}