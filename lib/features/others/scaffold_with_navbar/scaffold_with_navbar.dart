import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';
import 'package:movie/features/others/scaffold_with_navbar/bloc/navigation_bloc.dart';
import 'package:movie/features/others/scaffold_with_navbar/bloc/navigation_event.dart';
import 'package:movie/features/others/scaffold_with_navbar/bloc/navigation_state.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
            body: navigationShell,
            bottomNavigationBar: Container(
              height: MediaQuery.sizeOf(context).height*.1,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: MyColors.activeIconColor, // Change this to your desired color
                          width: 1))),
              child: BottomNavigationBar(
                backgroundColor: MyColors.backgroundColor,
                selectedItemColor: MyColors.activeIconColor,
                unselectedItemColor: MyColors.inactiveIconColor,
                currentIndex: state.index,
                onTap: (index) {
                  navigationShell.goBranch(index);
                  context.read<NavigationBloc>().add(UpdateNavigationIndex(index));
                },
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      state.index == 0 ? MyIcons.home : MyIcons.homeInactive,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      state.index == 1 ? MyIcons.search : MyIcons.searchInactive,
                    ),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      state.index == 2 ? MyIcons.bookmark : MyIcons.bookmarkInactive,
                    ),
                    label: 'Watch list',
                  ),
                ],
              ),
            ));
      },
    );
  }
}
