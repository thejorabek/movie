import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        SvgPicture.asset(MyIcons.star),
        SizedBox(width: width*.01),
        Text(
          '9.5',
          style: TextStyle(color: MyColors.starColor),
        )
      ],
    );
  }
}
