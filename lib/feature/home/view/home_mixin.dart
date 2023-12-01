import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';
import 'bottom_nav_bar_view.dart';
import 'home_view.dart';
import 'settings_view.dart';

mixin HomeMixin on State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().init();
  }

  final List<Widget> bottomBarWidget = [const HomeView(), const SettingsView()];

  final ValueNotifier<int> currentPageIndex = ValueNotifier(0);
}
