import 'package:uuid/uuid.dart';

class UserCrime {
  Uuid userUuid;
  Uuid crimeUuid;

  UserCrime(
    this.userUuid,
    this.crimeUuid,
  );
}
