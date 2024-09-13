import "package:flutter/material.dart";
import "package:movie/core/widgets/bottom_navigation/bottom_indicator_bar.dart";
import "package:go_router/go_router.dart";

class MainPage extends StatelessWidget {
  const MainPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: navigationShell.currentIndex != 0,
        onPopInvoked: (bool v) => navigationShell.goBranch(0),
        child: Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomIndicatorBar(
            currentIndex: navigationShell.currentIndex,
            child: BottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (int index) => changeTap(index, context),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.abc),
                  label: "Главная",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.ac_unit_outlined),
                  label: "ТВ",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarms_rounded),
                  label: "Каталог",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.accessibility_new),
                  label: "Избранное",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.accessible_forward_outlined),
                  label: "Профиль",
                ),
              ],
            ),
          ),
        ),
      );

  void changeTap(
    int index,
    BuildContext context,
  ) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
