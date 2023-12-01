import 'current_weather.dart';
import 'daily_weather.dart';

class WeatherModel {
  CurrentWeatherModel current;
  String temperatureType;
  DailyWeatherModel daily;

  WeatherModel({required this.current, required this.daily, required this.temperatureType});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        current: CurrentWeatherModel.fromJson(json["current"]),
        daily: DailyWeatherModel.fromJson(json["daily"]),
        temperatureType: json["daily_units"]["temperature_2m_min"],
      );
}
