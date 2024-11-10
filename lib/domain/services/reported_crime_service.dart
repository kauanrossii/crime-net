import 'dart:convert';

import 'package:crime_net/domain/enums/crime_type.dart';
import 'package:crime_net/domain/models/reported_crime.dart';
import 'package:crime_net/domain/services/base_service.dart';
import 'package:http/http.dart';

class ReportedCrimeService extends BaseService<ReportedCrime> {
  ReportedCrimeService({Client? client})
      : super(httpClient: client, 'reported-crimes');

  @override
  Future<List<ReportedCrime>> getAll({CrimeType? type}) async {
    print(getBaseAddress());
    print(getResource());

    var uri = Uri.parse("${getBaseAddress()}/${getResource()}");

    if (type != null) {
      uri = uri.replace(queryParameters: {
        ...uri.queryParameters,
        'type': type.toString(),
      });
    }

    var response = await getClient().get(uri);
    print(response);
    var json = jsonDecode(response.body) as List;
    var jsonList =
        json.map((element) => element as Map<String, dynamic>).toList();
    return jsonList.map((element) => mapToDto(element)).toList();
  }

  @override
  ReportedCrime mapToDto(Map<String, dynamic> json) {
    return ReportedCrime.fromJson(json);
  }
}
