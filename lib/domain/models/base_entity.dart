import 'package:uuid/uuid.dart';

abstract class BaseEntity {
  late Uuid uuid;

  BaseEntity();

  BaseEntity.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'] as Uuid;
  }
}
