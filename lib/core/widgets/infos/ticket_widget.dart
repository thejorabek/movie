import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';

// ignore: must_be_immutable
class TicketWidget extends StatelessWidget {
  TicketWidget({super.key, required this.ticket});

  String ticket;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        SvgPicture.asset(MyIcons.ticket),
        SizedBox(width: width * .02),
        Text(ticket, style: const TextStyle(color: MyColors.inactiveIconColor, fontSize: 16)),
      ],
    );
  }
}
