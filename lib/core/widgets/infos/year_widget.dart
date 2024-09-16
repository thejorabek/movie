import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';

class YearWidget extends StatelessWidget {
  const YearWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        SvgPicture.asset(MyIcons.calendar),
        SizedBox(width: width * .02),
        Text('2021', style: TextStyle(color: MyColors.inactiveIconColor, fontSize: 16)),
      ],
    );
  }
}
