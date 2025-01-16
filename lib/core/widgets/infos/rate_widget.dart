import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';

// ignore: must_be_immutable
class RateWidget extends StatelessWidget {
  RateWidget({super.key, required this.rate});
  double rate;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        SvgPicture.asset(MyIcons.star),
        SizedBox(width: width * .01),
        Text(
          '$rate',
          style: const TextStyle(color: MyColors.starColor),
        )
      ],
    );
  }
}
