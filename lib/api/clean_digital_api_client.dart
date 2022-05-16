import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'api_constants.dart';

part 'clean_digital_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.host)
abstract class CleanDigitalApiClient {
  factory CleanDigitalApiClient(
    Dio dio, {
    String baseUrl,
  }) = _CleanDigitalApiClient;
}
