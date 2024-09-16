import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        SvgPicture.asset(MyIcons.ticket),
        SizedBox(width: width * .02),
        Text('Ation', style: TextStyle(color: MyColors.inactiveIconColor, fontSize: 16)),
      ],
    );
  }
}