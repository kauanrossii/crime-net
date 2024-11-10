import 'package:crime_net/components/list_reported_crimes.dart';
import 'package:crime_net/domain/services/reported_crime_service.dart';
import 'package:crime_net/pages/base_page.dart';
import 'package:flutter/material.dart';

class ReportedCrimesPage extends StatelessWidget {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  const ReportedCrimesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Crimes reportados",
      body: Center(
          child:
              ListReportedCrimes(reportedCrimeService: ReportedCrimeService())),
    );
  }
}
