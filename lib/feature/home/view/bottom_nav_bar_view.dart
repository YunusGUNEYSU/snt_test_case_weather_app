import 'package:flutter/material.dart';

import '../../../core/extensions/colorscheme.dart';
import '../../../core/extensions/index.dart';

import 'home_mixin.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentPageIndex,
      builder: (context, val, child) {
        return Scaffold(
          bottomNavigationBar: NavigationBar(
              backgroundColor: Colors.transparent,
              indicatorColor: context.colorSheme.primary,
              selectedIndex: val,
              elevation: 5,
              onDestinationSelected: (index) {
                currentPageIndex.value = index;
              },
              destinations: const [
                NavigationDestination(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'Home'),
                NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
              ]),
          body: bottomBarWidget[val],
        );
      },
    );
  }
}
