import 'package:crime_net/domain/enums/crime_type.dart';
import 'package:uuid/uuid.dart';

class Crime {
  late Uuid uuid;
  DateTime date;
  String latitude;
  String longitude;
  CrimeType type;

  Crime(
    this.type,
    this.latitude,
    this.longitude,
    this.date,
  ) {
    uuid = const Uuid();
  }
}
