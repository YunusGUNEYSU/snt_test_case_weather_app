import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../util/service/constants.dart';
import '../model/city/city.dart';

abstract interface class ICityService {
  final Dio dio;

  ICityService({required this.dio});
  Future<List<CityModel>?> getCity();
}

class CityService extends ICityService {
  CityService({required super.dio});

  @override
  Future<List<CityModel>?> getCity() async {
    try {
      final response = await dio.get(ServicePath.turkeyApiPath.apiPath);
      if (response.statusCode == 200) {
        final jsonData = response.data['data'];
        if (jsonData is List) {
          return jsonData.map((e) => CityModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return null;
  }
}
