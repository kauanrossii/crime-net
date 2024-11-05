import 'package:crime_net/domain/models/user.dart';
import 'package:crime_net/domain/services/base_service.dart';

class UserService extends BaseService<User> {
  UserService() : super("users");

  @override
  User mapToDto(Map<String, dynamic> json) {
    return User.fromJson(json);
  }
}
