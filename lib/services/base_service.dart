import 'dart:io';

import '../l10n/clean_digital_localizations.dart';
import 'preferences_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../di/injection_container.dart';
import '../exceptions/api_exception.dart';
import '../exceptions/application_exception.dart';
import '../exceptions/base_exception.dart';
import '../exceptions/storage_null_value_exception.dart';

abstract class BaseService {
  @protected
  final preferencesService = locator<PreferencesService>();

  Future<T> makeErrorHandledCall<T>(AsyncValueGetter<T> callback) async {
    final localizations = await preferencesService.getLocalizations();

    final generalErrorMessage = localizations.generalAppErrorMessage;

    try {
      return await callback();
    } on StorageNullValueException {
      rethrow;
    } on ApplicationException {
      rethrow;
    } on DioError catch (error) {
      throw await _getProccessedDioError(error, localizations);
    } catch (exception) {
      throw ApplicationException(generalErrorMessage);
    }
  }

  Future<BaseException> _getProccessedDioError(
    DioError exception,
    CleanDigitalLocalizations localizations,
  ) async {
    try {
      await InternetAddress.lookup('example.com');
    } on SocketException {
      return ApplicationException(localizations.noInternetConnection);
    }

    final unknownApiException = ApiException(
      message: localizations.serverErrorMessage,
    );

    return unknownApiException;

//TODO: Use it after fix on server
    // try {
    //   var response = exception.response?.data;

    //   if (response == null) {
    //     return unknownApiException;
    //   }

    //   if (response is String) {
    //     response = json.decode(response);
    //   }

    //   final apiError = ApiError.fromJson(response);

    //   return ApiException(
    //     statusCode: apiError.status,
    //     message: apiError.message,
    //     detail: apiError.detail,
    //   );
    // } catch (_) {
    //   return unknownApiException;
    // }
  }
}
