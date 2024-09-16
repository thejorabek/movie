import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';
import 'package:movie/features/others/scaffold_with_navbar/bloc/navigation_bloc.dart';
import 'package:movie/features/others/scaffold_with_navbar/bloc/navigation_event.dart';

class GlobalSearch extends StatelessWidget {
  const GlobalSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
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
              //
              SizedBox(
                  width: width * .7,
                  height: height,
                  child: TextFormField(
                    cursorColor: MyColors.inactiveIconColor,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: height * .01),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: MyColors.inactiveIconColor), // Matches the hint text color in the image
                      border: InputBorder.none, // Removes the underline border
                    ),
                  )),
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
