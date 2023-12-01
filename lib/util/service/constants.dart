enum ServicePath {
  meteoForeCast('v1/forecast'),
  turkeyApiPath('api/v1/provinces');

  final String apiPath;
  const ServicePath(this.apiPath);
}

final class ServiceConstants {
  const ServiceConstants._();
  static const String meteoBaseUrl = 'https://api.open-meteo.com/';
  static const String turkeyBaseUrl = 'https://turkiyeapi.dev/';
}
