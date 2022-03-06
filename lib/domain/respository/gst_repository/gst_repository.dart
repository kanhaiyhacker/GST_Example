import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:gst_app/data/api_client/retro_client.dart';
import 'package:gst_app/data/api_client/api_endpoints.dart';
import 'package:gst_app/data/mapper/gst_search/gst_search.dart';
import 'package:gst_app/data/model/gst_detail/gst_detail_response.dart';
import 'package:gst_app/domain/model/gst/gst_detail.dart';
import 'package:gst_app/service/api_response_wrapper.dart';
import 'package:gst_app/service/app_exception.dart';
import 'package:gst_app/service/service_manager.dart';

class GSTRepository {
  late RestClient _apiClient;

  GSTRepository() {
    var dioClient = ServiceManager.get().getDioClient(baseUrl: kBaseUrl);
    _apiClient = RestClient(dioClient);
  }

  Future<ApiResponseWrapper<GSTDetail>> getGSTDetail(String gstNumber) async {
    try {
      final gstResponse = await _apiClient.getGSTDetail(gstNumber);
      return ApiResponseWrapper()..setData(mapGSTDetail(gstResponse));
    } on Exception catch (e) {
      return ApiResponseWrapper()..setException(ExceptionHandler(e));
    }
  }

  Future<ApiResponseWrapper<GSTDetail>> getMockGSTDetail(
      String gstNumber) async {
    try {
      //sleep(const Duration(seconds: 3));
      final String response =
          await rootBundle.loadString('assets/json/gst_search_response.json');
      print(response);
      final data = await json.decode(response);
      return ApiResponseWrapper()
        ..setData(mapGSTDetail(GSTDetailResponse.fromJson(data)));
    } on Exception catch (e) {
      return ApiResponseWrapper()..setException(ExceptionHandler(e));
    }
  }
}
