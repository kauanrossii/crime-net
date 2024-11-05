import 'package:crime_net/domain/models/reported_crime.dart';
import 'package:crime_net/domain/services/reported_crime_service.dart';
import 'package:flutter/material.dart';

class ListReportedCrimes extends StatefulWidget {
  final ReportedCrimeService reportedCrimeService;

  const ListReportedCrimes({super.key, required this.reportedCrimeService});

  @override
  State<StatefulWidget> createState() => ListReportedCrimesState();
}

class ListReportedCrimesState extends State<ListReportedCrimes> {
  List<ReportedCrime> reportedCrimes = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reportedCrimes.length,
      itemBuilder: (context, index) {
        final reportedCrime = reportedCrimes[index];
        return ListTile(
          title: Text(reportedCrime.type.toString()),
          subtitle: Text("Data do ocorrido: ${reportedCrime.date}"),
        );
      }
    );
  }

  fetchData() async {
    final loadedReportedCrimes = await widget.reportedCrimeService.getAll();
    setState(() {
      reportedCrimes = loadedReportedCrimes;
    });
  }
}