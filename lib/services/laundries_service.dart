import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../api/clean_digital_api_client.dart';
import '../models/pagination/laundries_pagination.dart';
import 'base_service.dart';

@injectable
class LaundriesService extends BaseService {
  final CleanDigitalApiClient _apiClient;

  LaundriesService(this._apiClient);

  Future<LaundriesPagination> getAllLaundries({
    int page = 0,
    int size = 10,
  }) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getLaundries(page, size);
    });
  }
}
