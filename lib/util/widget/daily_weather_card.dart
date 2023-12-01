import 'package:flutter/material.dart';

import '../../core/constants/border_radius.dart';
import '../../core/extensions/index.dart';
import 'wheather_icon.dart';

class DailyWeatherCard extends StatelessWidget {
  const DailyWeatherCard(
      {super.key,
      required this.title,
      required this.maxTempature,
      required this.minTempature,
      required this.weatherCode,
      required this.tempatureType, required this.dailyDate});
  final String title;
  final double maxTempature;
  final double minTempature;
  final int weatherCode;
  final String tempatureType;
  final String dailyDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.08,
      width: context.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: AppRadius.circular(),
        color: context.colorSheme.primary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(dailyDate,style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),),
          Text(
            title,
            style: context.textTheme.bodyLarge,
          ),
          WeatherIcon(weatherCode: weatherCode, isCurrent: false),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.arrow_downward_outlined),
              Text(minTempature.round().toString()),
              const Icon(Icons.arrow_upward_outlined),
              Text(maxTempature.round().toString() + tempatureType)
            ],
          )
        ],
      ),
    );
  }
}
