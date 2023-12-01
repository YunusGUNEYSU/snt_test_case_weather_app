// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snt_test_case/core/cache/constants.dart';
import 'package:snt_test_case/core/extensions/date_time.dart';
import 'package:snt_test_case/feature/home/model/city/city.dart';
import 'package:snt_test_case/feature/home/model/weather/weather.dart';
import 'package:snt_test_case/feature/home/service/search_service.dart';
import 'package:snt_test_case/feature/home/service/weather_service.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider({required this.iWeatherService, required this.cityService});
  IWeatherService iWeatherService;
  WeatherModel? _weatherModel;
  WeatherModel? get weatherModel => _weatherModel;
  String? _cityName;
  String? get cityName => _cityName;
  Position? _position;
  Position? get position => _position;
  double _latitude = 0;
  double _longitude = 0;
  bool _isLoading = false;
  ICityService cityService;
  List<CityModel>? _listCity = [];
  List<CityModel>? get listCity => _listCity;

  Future<void> getCitys() async {
    _listCity = await cityService.getCity();
    notifyListeners();
  }

  String getWeatherForecast(int weatherCode) {
    switch (weatherCode) {
      case 0 || 1 || 2 || 3:
        return 'Sunny';
      case 45 || 48 || 51 || 53 || 55 || 56 || 57:
        return 'Cloud';
      case 61 || 63 || 65 || 66 || 67 || 80 || 81 || 82:
        return 'Rainy';
      case 71 || 73 || 75 || 77 || 85 || 86:
        return 'Snow';
      case 95 || 96 || 99:
        return 'Thunder';
      default:
        return 'Sunny';
    }
  }

  String dailyDateTime(DateTime dateTime) {
    String date = '';
    if (dateTime.day == DateTime.now().day) {
      date = 'Today';
    } else {
      date = dateTime.dayTime;
    }
    return date;
  }

  bool get isLoading => _isLoading;
  set setLoading(bool loading) => _isLoading = loading;
  Future<void> init() async {
    await getPosition();
    await getWeather();
    await getCitys();
    checkPosition();
  }

  Future<void> getPosition() async {
    setLoading = true;
    _position = await iWeatherService.getPosition();
    List<Placemark> placeMark =
        await placemarkFromCoordinates(position?.latitude ?? 0, position?.longitude ?? 0);
    String? city = placeMark[0].locality;
    _cityName = city;
    setLoading = false;
    notifyListeners();
  }

  Future<void> changePosition(String? cityName) async {
    final double? cityLatitude =
        _listCity?.where((element) => element.cityName == cityName).map((e) => e.latitude).first;
    final double? cityLongitude =
        _listCity?.where((element) => element.cityName == cityName).map((e) => e.longitude).first;
    _cityName = cityName;
    _latitude = cityLatitude ?? 0;
    _longitude = cityLongitude ?? 0;
    notifyListeners();
    await getWeather();
  }

  void checkPosition() {
    if (position != null) {
      _latitude = position!.latitude;
      _longitude = position!.longitude;
      notifyListeners();
    }
  }

  Future<void> getWeather({String? tempaturePath}) async {
    setLoading = true;

    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool(CacheEnum.isCelsius.name) == true) {
      _weatherModel = await iWeatherService.fetchWeather(
          latitude: _latitude, longitude: _longitude, tempatureUnit: 'celsius');
      notifyListeners();
    } else {
      _weatherModel = await iWeatherService.fetchWeather(
          latitude: _latitude, longitude: _longitude, tempatureUnit: 'fahrenheit');
      notifyListeners();
    }

    setLoading = false;
    notifyListeners();
  }
}
