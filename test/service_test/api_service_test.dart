import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:structure_app/di/injector_provider.dart';
import 'package:structure_app/network/http_client.dart';
import 'package:flutter_test/flutter_test.dart';

import '../core/test_constants.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);
  var baseUrl;
  setUpAll(() {
    setupInjection();
    baseUrl = 'https://api.apilayer.com/exchangerates_data/';
  });

  group('- ApiService class methods test', () {
    group('- Get Method', () {
      test('- Get symbol List test', () async {
        dioAdapter.onGet(
          '$baseUrl$wsSymbols',
          (request) {
            return request.reply(200, successMessage);
          },
          data: null,
          queryParameters: {},
          headers: {},
        );
        final service = HttpClient();

        final response = await service.get(wsSymbols,
            headers: {}, queryParameters: {}, dio: dio);

        expect(response, successMessage);
      });
      test('- Get rates List test', () async {
        dioAdapter.onGet(
          '$baseUrl$wsLatest',
          (request) {
            return request.reply(200, successMessage);
          },
          data: null,
          queryParameters: {},
          headers: {},
        );
        final service = HttpClient();

        final response = await service.get(wsSymbols,
            headers: {}, queryParameters: {}, dio: dio);
        expect(response, successMessage);
      });
    });
  });
  tearDownAll(() {
    print('Congrats all test cases passed');
  });
}
