class CityModel {
  String cityName;
  int cityId;
  double latitude;
  double longitude;
  CityModel({
    required this.cityName,
    required this.cityId,
    required this.latitude,
    required this.longitude,
  });
  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
      cityName: json["name"],
      cityId: json["id"],
      latitude: json["coordinates"]["latitude"]?.toDouble(),
      longitude: json["coordinates"]["longitude"]?.toDouble());
}
