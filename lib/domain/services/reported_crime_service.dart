import 'package:crime_net/domain/models/reported_crime.dart';
import 'package:crime_net/domain/services/base_service.dart';

class ReportedCrimeService extends BaseService<ReportedCrime> {
  ReportedCrimeService() : super('reported-crimes');

  @override
  ReportedCrime mapToDto(Map<String, dynamic> json) {
    return ReportedCrime.fromJson(json);
  }
}
