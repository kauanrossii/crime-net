import 'package:crime_net/domain/models/base_entity.dart';
import 'package:uuid/uuid.dart';

class User extends BaseEntity {
  late String _email;
  late String _password;

  getEmail() {
    return _email;
  }

  getPassword() {
    return _password;
  }

  User(this._email, this._password) {
    uuid = const Uuid();
  }

  @override
  User.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    uuid = json['uuid'] as Uuid;
    _email = json['email'] as String;
    _password = json['password'] as String;
  }

  updateInformations(String email, String password) {
    _email = email;
    _password = password;
  }
}
