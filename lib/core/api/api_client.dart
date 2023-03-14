import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../failures/api_exception.dart';
import 'api_constants.dart';
import 'status_code.dart';

class ApiClient {
  static const int _timeout = 120;

  Future<Map<String, dynamic>> get(
    String endPoint, {
    String? baseUrl,
    String? url,
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
    int? timeout,
  }) async {
    final uri = url != null
        ? Uri.parse(url)
        : Uri.http(ApiConstants.baseUrl, endPoint, parameters);
    print('******************* Request *********************');
    print(
      'method: GET\nurl: $uri\nheaders: ${ApiConstants.getHeaders(headers)}',
    );
    return await _requestServer(() async {
      final response = await http
          .get(
            uri,
            headers: ApiConstants.getHeaders(headers),
          )
          .timeout(
            Duration(seconds: timeout ?? _timeout),
          );

      return _handleStatusCode(response);
    });
  }

  Future<Map<String, dynamic>> post(
    String endPoint, {
    String? baseUrl,
    String? url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
    int? timeout,
  }) async {
    final uri = url != null
        ? Uri.parse(url)
        : Uri.http(ApiConstants.baseUrl, endPoint, parameters);
    print('******************* Request *********************');
    print(
      'method: POST\nurl: $uri\nheaders: ${ApiConstants.getHeaders(headers)}\nbody: $body',
    );
    return await _requestServer(() async {
      final response = await http
          .post(
            uri,
            body: body,
            headers: ApiConstants.getHeaders(headers),
          )
          .timeout(
            Duration(seconds: timeout ?? _timeout),
          );
      return _handleStatusCode(response);
    });
  }

  Future<Map<String, dynamic>> postFile(
    String endPoint,
    String? filePath,
    String field, {
    String? baseUrl,
    String? url,
    Map<String, String>? fields,
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
    int? timeout,
  }) async {
    final uri = url != null
        ? Uri.parse(url)
        : Uri.http(ApiConstants.baseUrl, endPoint, parameters);
    print('******************* Request *********************');
    print(
      'method: POST\nurl: $uri\nheaders: ${ApiConstants.getHeaders(headers)}\nfields: $fields',
    );

    return await _requestServer(() async {
      final request = http.MultipartRequest('POST', uri);
      request.headers.addAll(ApiConstants.getHeaders(headers));
      request.fields.addAll(fields ?? {});
      if (filePath != null) {
        request.files.add(await http.MultipartFile.fromPath(field, filePath));
      }
      final response = await request.send().timeout(
            Duration(seconds: timeout ?? _timeout),
          );
      return _handleStatusCode(await http.Response.fromStream(response));
    });
  }

  Future<Map<String, dynamic>> _requestServer(
    Future<Map<String, dynamic>> Function() computation,
  ) async {
    try {
      return await computation();
    } on SocketException {
      throw const NoInternetConnectionException();
    } on FormatException {
      throw const InvalidFormatException();
    } on HttpException {
      throw const NoResponseException();
    } on TimeoutException {
      throw const TimeEndException();
    } on Exception catch (error) {
      print(error.toString());
      if (error is ApiException) {
        rethrow;
      }
      throw UnKnownException(error.toString());
    }
  }

  Map<String, dynamic> _handleStatusCode(http.Response response) {
    print('******************* Response ********************');
    print(
        'status code ${response.statusCode}\nresult: ${json.decode(response.body)}');
    print('*************************************************');

    final body = json.decode(response.body);
    String? errorMessage;
    if (body['errors'] != null && body['errors'].isNotEmpty) {
      errorMessage = body['errors'][0]['value'];
    }
    switch (response.statusCode) {
      case StatusCode.ok:
        return body;
      case StatusCode.create:
        return body;
      case StatusCode.noContent:
        return body;
      case StatusCode.badRequest:
        throw BadRequestException(errorMessage);
      case StatusCode.unauthorized:
        throw UnAuthorizedException(errorMessage);
      case StatusCode.forbidden:
        throw ForbiddenException(errorMessage);
      case StatusCode.notFound:
        throw NotFoundException(errorMessage);
      case StatusCode.conflict:
        throw ConflictException(errorMessage);
      case StatusCode.serverError:
        throw ServerErrorException(errorMessage);
      default:
        throw UnKnownException(
          response.reasonPhrase,
          response.statusCode,
        );
    }
  }
}
