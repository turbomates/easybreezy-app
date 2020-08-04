import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:easybreezy_app/constants.dart';

Dio createDio() {
  Dio dio = Dio();
  dio.options.baseUrl = "https://easybreezy.tmsoft.dev";

  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final String token = await prefs.get(userToken);
    if (token != null) {
      options.headers["Authorization"] = "Bearer " + token;
    }

    return options;
  }));

  return dio;
}

Dio dio = createDio();
