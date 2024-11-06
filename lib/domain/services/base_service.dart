import 'dart:convert';

import 'package:crime_net/domain/models/base_entity.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class BaseService<T extends BaseEntity> {
  final http.Client _client;
  final String _resource;
  static const String _baseAddress = "http://localhost:3000";

  String getBaseAddress() {
    return _baseAddress;
  }

  String getResource() {
    return _resource;
  }

  Client getClient() {
    return _client;
  }

  BaseService(this._resource, {http.Client? httpClient})
      : _client = httpClient ?? http.Client();

  Future<T> get(int id) async {
    var response = await _client.get(Uri.parse('$_baseAddress/$_resource/$id'));
    var json = jsonDecode(response.body) as Map<String, dynamic>;
    return mapToDto(json);
  }

  Future<List<T>> getAll() async {
    var response = await _client.get(Uri.parse("$_baseAddress/$_resource"));
    var json = jsonDecode(response.body) as List;
    var jsonList =
        json.map((element) => element as Map<String, dynamic>).toList();
    return jsonList.map((element) => mapToDto(element)).toList();
  }

  Future<void> update(T data) async {
    await _client.put(Uri.parse("$_baseAddress/$_resource"));
  }

  Future<void> delete(int id) async {
    await _client.delete(Uri.parse("$_baseAddress/$_resource/$id"));
  }

  T mapToDto(Map<String, dynamic> json);
}
