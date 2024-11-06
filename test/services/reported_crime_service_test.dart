import 'dart:convert';

import 'package:crime_net/domain/enums/crime_type.dart';
import 'package:crime_net/domain/services/reported_crime_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements Client {}

class MockResponse extends Mock implements Response {}

void main() {
  final Client client = MockHttpClient();
  final Response response = MockResponse();
  final ReportedCrimeService service = ReportedCrimeService(client: client);

  setUp(() {
    when(() => response.body).thenReturn(jsonEncode([
      {
        "uuid": 1,
        "userId": 1,
        "type": CrimeType
            .theft.value,
        "latitude": "-23.4261063",
        "longitude": "-51.938256"
      }
    ]));
    when(() => response.statusCode).thenReturn(200);
    when(() => response.headers)
        .thenReturn({'content-type': 'application/json'});

    when(() => client.get(Uri.parse('http://localhost:3000/reported-crimes?type=theft'))).thenAnswer((_) async =>
        response);
  });

  test('Must get reported crimes which type are equals theft', () async {
    final reportedCrimes = await service.getAll(type: CrimeType.theft);

    expect(
      reportedCrimes.every((crime) => crime.type == CrimeType.theft),
      isTrue,
    );
  });
}
