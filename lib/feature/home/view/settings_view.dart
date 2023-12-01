import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/index.dart';
import '../../../core/extensions/index.dart';
import '../../../util/widget/app_button.dart';
import '../provider/home_provider.dart';
import '../provider/settings_provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsProvider>().init();
  }

  static const String _fahrenheit = 'fahrenheit';
  static const String _celsius = 'celsius';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'S E T T I N G S',
          style: context.textTheme.bodyLarge,
        ),
      ),
      body: Consumer<SettingsProvider>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: AppPadding.leftHigh(),
                    child: Text('Change the temperature unit'),
                  ),
                  Switch.adaptive(
                      splashRadius: 20,
                      value: value.isCelsius,
                      onChanged: (val) async {
                        await value.changeTempatureType(val);
                      })
                ],
              ),
              Center(
                child: Padding(
                  padding: const AppPadding.bottomHigh(),
                  child: AppButton(
                      onTap: () async {
                        if (!value.isCelsius) {
                          await context.read<HomeProvider>().getWeather(tempaturePath: _fahrenheit);
                        } else {
                          await context.read<HomeProvider>().getWeather(tempaturePath: _celsius);
                        }
                      },
                      height: context.height * 0.07,
                      width: context.width * 0.9,
                      child: Center(
                        child: Text(
                          'S A V E',
                          style: context.textTheme.bodyLarge,
                        ),
                      )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
