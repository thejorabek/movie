import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/constants/icons_constants.dart';
import 'package:movie/core/widgets/appbar/custom_appbar.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: CustomAppBar(
          icon: Icon(
            Icons.abc,
            color: MyColors.backgroundColor,
          ),
          title: 'Watch list',
          onTap: () {}),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(MyIcons.box),
          SizedBox(height: height * .02),
          Text('There Is No Movie Yet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: height * .02),
          Text('Find your movie by Type title,\n categories, years, etc ',style: TextStyle(color: Colors.white),textAlign: TextAlign.center)
        ],
      )),
    );
  }
}
