import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'core/constants/duration.dart';
import 'core/theme/theme.dart';
import 'feature/home/provider/home_provider.dart';
import 'feature/home/provider/settings_provider.dart';
import 'feature/home/service/search_service.dart';
import 'feature/home/service/weather_service.dart';
import 'feature/home/view/bottom_nav_bar_view.dart';
import 'util/service/constants.dart';

Future<void> main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const DurationManager.splashDuration());
  FlutterNativeSplash.remove();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => HomeProvider(
              cityService:CityService(dio: Dio(BaseOptions(baseUrl: ServiceConstants.turkeyBaseUrl))) ,
                iWeatherService:
                    WeatherService(dio: Dio(BaseOptions(baseUrl: ServiceConstants.meteoBaseUrl))))),
        ChangeNotifierProvider(create: (_) => SettingsProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const BottomNavBar());
  }
}
