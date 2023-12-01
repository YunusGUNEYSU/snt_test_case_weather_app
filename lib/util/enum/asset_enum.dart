enum AssetEnum {
  thunder('assets/weather_forecast/thunder.json'),
  sunny('assets/weather_forecast/sunny.json'),
  snow('assets/weather_forecast/snow.json'),
  rainy('assets/weather_forecast/rainy.json'),
  cloud('assets/weather_forecast/cloud.json');

  final String path;
  const AssetEnum(this.path);
}
