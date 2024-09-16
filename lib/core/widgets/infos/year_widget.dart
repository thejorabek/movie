import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';
import 'package:movie/core/widgets/search/global_searchbar/global_searchbar.dart';
import 'package:movie/services/detail/bloc/detail_bloc.dart';

class YearWidget extends StatelessWidget {
  YearWidget({super.key, required this.year});
  int year;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Row(
      children: [
        SvgPicture.asset(MyIcons.calendar),
        SizedBox(width: width * .02),
        Text('$year', style: TextStyle(color: MyColors.inactiveIconColor, fontSize: 16)),
      ],
    );
  }
}
