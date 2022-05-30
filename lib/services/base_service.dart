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
    final unknownApiException = ApiException(
      message: localizations.serverErrorMessage,
    );
    try {
      var response = exception.response?.data;
      if (response == null) {
        return unknownApiException;
      }
      final apiError = ApiException(
        message: response?['message'],
        statusCode: response?['statusCode'],
      );
      return apiError;
    } catch (_) {
      return unknownApiException;
    }
  }
}
