class DailyWeatherModel {
  List<DateTime> time;
  List<int> weatherCode;
  List<double> temperature2MMax;
  List<double> temperature2MMin;

  DailyWeatherModel({
    required this.time,
    required this.weatherCode,
    required this.temperature2MMax,
    required this.temperature2MMin,
  });

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) => DailyWeatherModel(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        weatherCode: List<int>.from(json["weather_code"].map((x) => x)),
        temperature2MMax: List<double>.from(json["temperature_2m_max"].map((x) => x?.toDouble())),
        temperature2MMin: List<double>.from(json["temperature_2m_min"].map((x) => x?.toDouble())),
      );
}
