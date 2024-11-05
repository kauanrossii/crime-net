import 'package:crime_net/domain/enums/crime_type.dart';
import 'package:crime_net/domain/models/base_entity.dart';
import 'package:uuid/uuid.dart';

class ReportedCrime extends BaseEntity {
  late Uuid userId;
  late DateTime date;
  late String latitude;
  late String longitude;
  late CrimeType type;

  ReportedCrime(
    this.userId,
    this.type,
    this.latitude,
    this.longitude,
    this.date,
  ) {
    uuid = const Uuid();
  }

  @override
  ReportedCrime.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    uuid = json['uuid'] as Uuid;
    userId = json['userId'] as Uuid;
    type = json['type'] as CrimeType;
    latitude = json['latitude'] as String;
    longitude = json['longitude'] as String;
    date = json['date'] as DateTime;
  }
}
