import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';

// ignore: must_be_immutable
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
        Text('$year', style: const TextStyle(color: MyColors.inactiveIconColor, fontSize: 16)),
      ],
    );
  }
}
