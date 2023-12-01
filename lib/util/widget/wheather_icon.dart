import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/extensions/index.dart';
import '../enum/asset_enum.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    super.key,
    required this.weatherCode,
    required this.isCurrent,
  });
  final int weatherCode;
  final bool isCurrent;

  String lottiePath() {
    switch (weatherCode) {
      case 0 || 1 || 2 || 3:
        return AssetEnum.sunny.path;
      case 45 || 48 || 51 || 53 || 55 || 56 || 57:
        return AssetEnum.cloud.path;
      case 61 || 63 || 65 || 66 || 67 || 80 || 81 || 82:
        return AssetEnum.rainy.path;
      case 71 || 73 || 75 || 77 || 85 || 86:
        return AssetEnum.snow.path;
      case 95 || 96 || 99:
        return AssetEnum.thunder.path;
      default:
        return AssetEnum.cloud.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(lottiePath(),
        width: context.width * 0.5,
        filterQuality: FilterQuality.high,
        alignment: Alignment.center,
        repeat: true,
        fit: BoxFit.cover);
  }
}
