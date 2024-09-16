import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';
import 'package:movie/features/others/scaffold_with_navbar/bloc/navigation_bloc.dart';
import 'package:movie/features/others/scaffold_with_navbar/bloc/navigation_event.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.read<NavigationBloc>().add(UpdateNavigationIndex(1));
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width * .9,
          height: MediaQuery.sizeOf(context).height * .06,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.black),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .05,
              ),
              Text('Search', style: TextStyle(color: MyColors.inactiveIconColor, fontSize: 18)),
              Spacer(),
              SvgPicture.asset(MyIcons.searchIcon, width: 20, height: 20),
               SizedBox(
                width: MediaQuery.sizeOf(context).width * .05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}