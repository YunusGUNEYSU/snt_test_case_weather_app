import 'dart:io';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import '../../../util/service/constants.dart';
import '../model/weather/weather.dart';

abstract interface class IWeatherService {
  final Dio dio;
  Future<WeatherModel?> fetchWeather(
      {required double latitude, required double longitude, String? tempatureUnit});

  Future<Position> getPosition();
  IWeatherService({required this.dio});
}

class WeatherService extends IWeatherService {
  WeatherService({required super.dio});

  @override
  Future<WeatherModel?> fetchWeather(
      {required double latitude, required double longitude, String? tempatureUnit}) async {
    final response = await dio.get(ServicePath.meteoForeCast.apiPath, queryParameters: {
      'latitude': latitude,
      'longitude': longitude,
      'current': 'temperature_2m,weather_code',
      'daily': 'weather_code,temperature_2m_max,temperature_2m_min',
      'temperature_unit': tempatureUnit??'celsius'
    });
    if (response.statusCode == HttpStatus.ok) {
      final jsonData = response.data;
      if (jsonData is Map<String, dynamic>) {
        return WeatherModel.fromJson(jsonData);
      }
    }
    return null;
  }

  @override
  Future<Position> getPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
