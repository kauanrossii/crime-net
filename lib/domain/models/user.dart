import 'package:uuid/uuid.dart';

class User {
  late Uuid uuid;
  String email;
  String password;

  User(this.email, this.password) {
    uuid = const Uuid();
  }
}