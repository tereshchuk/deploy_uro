import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ReportMeasurementCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? url,
    String? measurementId = '',
  }) async {
    url ??= FFDevEnvironmentValues().baseUrl;

    final ffApiRequestBody = '''
{"id":${measurementId}}''';
    return ApiManager.instance.makeApiCall(
      callName: 'reportMeasurement',
      apiUrl: '${url}/functions/v1/report',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PaymentUserCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? url,
  }) async {
    url ??= FFDevEnvironmentValues().baseUrl;

    return ApiManager.instance.makeApiCall(
      callName: 'paymentUser',
      apiUrl: '${url}/functions/v1/stipe-create-checkout',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateEmailUserCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? newEmail = '',
    String? url,
  }) async {
    url ??= FFDevEnvironmentValues().baseUrl;

    final ffApiRequestBody = '''
{"email":"${newEmail}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateEmailUser',
      apiUrl: '${url}/functions/v1/change-email',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? url,
  }) async {
    url ??= FFDevEnvironmentValues().baseUrl;

    return ApiManager.instance.makeApiCall(
      callName: 'deleteUser',
      apiUrl: '${url}/functions/v1/delete-user',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
