import 'package:crime_net/domain/enums/crime_type.dart';
import 'package:crime_net/domain/models/base_entity.dart';
import 'package:uuid/uuid.dart';

class ReportedCrime extends BaseEntity {
  late String userId;
  late double latitude;
  late double longitude;
  late DateTime date;
  late CrimeType type;

  ReportedCrime(
    this.userId,
    this.type,
    this.latitude,
    this.longitude,
    this.date,
  ) {
    uuid = const Uuid().toString();
  }

  @override
  ReportedCrime.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    userId = json['userId'] as String;
    type = CrimeType.values.firstWhere((e) => e.name == json['type']);
    latitude = double.parse(json['latitude']);
    longitude = double.parse(json['longitude']);
    date = DateTime.parse(json['date'] as String);
  }
}
