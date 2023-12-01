class CurrentWeatherModel {
  String time;
  int interval;
  double temperature2M;
  int weatherCode;

  CurrentWeatherModel({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.weatherCode,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) => CurrentWeatherModel(
        time: json["time"],
        interval: json["interval"],
        temperature2M: json["temperature_2m"]?.toDouble(),
        weatherCode: json["weather_code"],
      );
}