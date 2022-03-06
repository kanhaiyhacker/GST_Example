import 'dart:collection';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ServiceManager {
  static ServiceManager? _serviceManager;
  String? _baseUrl;
  late bool _isDebug;
  HashMap<String, String> _defaultHeaders = HashMap();

  static void init(
      {@required String? baseUrl,
      @required bool? isDebug,
      HashMap<String, String>? defaultHeaders}) {
    _serviceManager ??= ServiceManager._instance(
        baseUrl: baseUrl, isDebug: false, defaultHeaders: defaultHeaders);
  }

  ServiceManager._instance(
      {@required String? baseUrl,
      bool isDebug = false,
      HashMap<String, String>? defaultHeaders}) {
    _baseUrl = baseUrl;
    _isDebug = isDebug;
    if (defaultHeaders != null && defaultHeaders.isNotEmpty) {
      _defaultHeaders.addAll(defaultHeaders);
    }
  }

  static ServiceManager get() {
    if (_serviceManager == null) {
      throw Exception('Method not initialised');
    }
    return _serviceManager!;
  }

  Dio getDioClient(
      {String? baseUrl,
      BaseOptions? options,
      HashMap<String, String>? moreHeader,
      HashMap<String, String>? cacheManager}) {
    final dio = options != null ? Dio(options) : Dio();
    var hashMap = HashMap<String, String>();
    hashMap['Content-Type'] = 'application/json;charset=utf-8';
    hashMap['accept'] = 'application/json; charset=utf-8';

    dio
      ..options.baseUrl = baseUrl ?? ''
      ..options.headers.addAll(hashMap);

    if (_defaultHeaders.isNotEmpty) {
      dio.options.headers.addAll(_defaultHeaders);
    }

    if (moreHeader != null && moreHeader.isNotEmpty) {
      dio.options.headers.addAll(moreHeader);
    }

    if (_isDebug) {
      dio.interceptors.add(LogInterceptor(
          request: true, responseBody: true, requestHeader: true));
    }

    return dio;
  }
}
