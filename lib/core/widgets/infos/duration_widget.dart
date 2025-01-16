import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';

// ignore: must_be_immutable
class DurationWidget extends StatelessWidget {
   DurationWidget({
    super.key,
    required this.duration
  });

  int duration;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        SvgPicture.asset(MyIcons.clock),
        SizedBox(width: width * .02),
        Text('$duration minutes', style: const TextStyle(color: MyColors.inactiveIconColor, fontSize: 16)),
      ],
    );
  }
}
