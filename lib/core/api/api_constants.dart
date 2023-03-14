class ApiConstants {
  const ApiConstants._();

  static const String baseUrl = 'ibn-sina.tufahatin-sa.com';
  static const String login = '/api/login';

  // headers
  static const String acceptLanguage = 'Accept-Language';
  static const String devicesToken = 'Devices-Token';
  static const String accept = 'Accept';
  static const String applicationJson = 'application/json';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';

  static Map<String, String> getHeaders(Map<String, String>? headers) {
    return {
      ...{
        accept: applicationJson,
      },
      ...headers ?? {}
    };
  }
}
