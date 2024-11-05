import 'package:crime_net/domain/models/base_entity.dart';
import 'package:uuid/uuid.dart';

class User extends BaseEntity {
  late String email;
  late String password;

  User(this.email, this.password) {
    uuid = const Uuid();
  }

  @override
  User.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    uuid = json['uuid'] as Uuid;
    email = json['email'] as String;
    password = json['password'] as String;
  }
}
