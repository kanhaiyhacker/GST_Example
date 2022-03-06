import 'package:dio/dio.dart';
import 'package:gst_app/data/model/gst_detail/gst_detail_response.dart';
import 'package:retrofit/http.dart';

import 'api_endpoints.dart';

part 'retro_client.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(kSearchGST)
  Future<GSTDetailResponse> getGSTDetail(@Path('gst') String gstNumber);
}
