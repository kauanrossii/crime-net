import 'dart:convert';

import 'package:crime_net/domain/models/base_entity.dart';
import 'package:http/http.dart' as http;

abstract class BaseService<T extends BaseEntity> {
  final String _resource;
  static const String _baseAddress = "http://localhost:3000";

  BaseService(this._resource);

  Future<T> get(int id) async {
    var response = await http.get(Uri.parse('$_baseAddress/$_resource/$id'));
    var json = jsonDecode(response.body) as Map<String, dynamic>;
    return mapToDto(json);
  }

  Future<List<T>> getAll() async {
    var response = await http.get(Uri.parse("$_baseAddress/$_resource"));
    var json = jsonDecode(response.body) as List;
    var jsonList =
        json.map((element) => element as Map<String, dynamic>).toList();
    return jsonList.map((element) => mapToDto(element)).toList();
  }

  Future<void> delete(int id) async {
    await http.delete(Uri.parse("$_baseAddress/$_resource/$id"));
  }

  T mapToDto(Map<String, dynamic> json);
}
