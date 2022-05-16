// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clean_digital_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CleanDigitalApiClient implements CleanDigitalApiClient {
  _CleanDigitalApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://192.168.0.100:8080';
  }

  final Dio _dio;

  String? baseUrl;

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
