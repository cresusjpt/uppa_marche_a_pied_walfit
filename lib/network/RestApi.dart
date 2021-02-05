import 'package:dio/dio.dart';

import 'RestClient.dart';

class RestApi {
  static String BASE_URL_PART = "192.168.0.19";
  static String REST_API_WEB_URL = "http://walkfitapi.mikroair.com/";

  static RestClient createClient({String url}) {
    Dio dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.connectTimeout = 120000;
    dio.options.receiveTimeout = 10000;
    dio.options.sendTimeout = 10000;

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("JEANPAUL REQUEST ${options.queryParameters}");
      return options;
    }, onResponse: (Response response) {
      return response;
    }, onError: (DioError error) {
      print("JEANPAUL REST API ERROR ${error.message}");
      return error;
    }));

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    //baseurl can be set by user, so change api request method signature
    if (url != null) {
      return RestClient(dio, baseUrl: url);
    } else {
      return RestClient(dio);
    }
  }
}
