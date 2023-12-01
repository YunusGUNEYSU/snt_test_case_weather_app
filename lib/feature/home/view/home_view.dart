import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/index.dart';
import '../../../core/extensions/index.dart';
import '../../../util/helper/search_delegate.dart';
import '../../../util/widget/daily_weather_card.dart';
import '../../../util/widget/loading_indicator.dart';
import '../../../util/widget/wheather_icon.dart';
import '../provider/home_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, child) {
      final weatherModel = value.weatherModel;

      return Scaffold(
        backgroundColor: context.colorSheme.background,
        appBar: AppBar(
          actions: [
            IconButton.filledTonal(
                onPressed: () async {
                  final result = await showSearch(context: context, delegate: CitySearchDelegate());
                  await value.changePosition(result);
                },
                icon: const Icon(Icons.search))
          ],
          title: Text(
            value.cityName ?? '',
            style: context.textTheme.headlineSmall,
          ),
        ),
        body: value.isLoading
            ? const LoadingIndicator()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const AppPadding.leftHigh(),
                              child: Text(
                                '${weatherModel?.current.temperature2M.round() ?? ''}${weatherModel?.temperatureType ?? ''}',
                                style: context.textTheme.displayMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.colorSheme.inversePrimary),
                              ),
                            ),
                            Padding(
                              padding: const AppPadding.leftHigh(),
                              child: Text(
                                value.getWeatherForecast(weatherModel?.current.weatherCode ?? 0),
                                style: context.textTheme.displaySmall
                                    ?.copyWith(color: context.colorSheme.inversePrimary),
                              ),
                            )
                          ],
                        ),
                        WeatherIcon(
                            weatherCode: weatherModel?.current.weatherCode ?? 0, isCurrent: true)
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.1,
                    ),
                    Padding(
                      padding: const AppPadding.leftHigh(),
                      child: Text(
                        'Daily Forecast',
                        style: context.textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    SizedBox(
                      height: context.height * 0.35,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: weatherModel?.daily.time.length,
                        itemBuilder: (BuildContext context, int index) {
                          final maxTempature = weatherModel?.daily.temperature2MMax[index];
                          final weatherDailyCode = weatherModel?.daily.weatherCode[index];
                          final minTempature = weatherModel?.daily.temperature2MMin[index];
                          final dailyDate = weatherModel?.daily.time[index];
                          return Padding(
                            padding: const AppPadding.leftHigh(),
                            child: DailyWeatherCard(
                                title: value.getWeatherForecast(weatherDailyCode ?? 0),
                                dailyDate: value.dailyDateTime(dailyDate ?? DateTime.now()),
                                tempatureType: weatherModel?.temperatureType ?? '',
                                maxTempature: maxTempature ?? 0,
                                minTempature: minTempature ?? 0,
                                weatherCode: weatherDailyCode ?? 0),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
