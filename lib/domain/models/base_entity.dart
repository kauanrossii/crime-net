import 'package:uuid/uuid.dart';

abstract class BaseEntity {
  late String uuid;

  BaseEntity() {
    uuid = const Uuid().toString();
  }

  BaseEntity.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'] as String;
  }
}
