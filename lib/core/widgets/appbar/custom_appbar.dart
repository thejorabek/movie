import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/constants/colors.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.icon, required this.title, required this.onTap, this.height=kToolbarHeight});

  String title;
  Widget icon;
  VoidCallback onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.backgroundColor,
      leading: IconButton(
          onPressed: () {
            GoRouter.of(context).go('/home');
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      centerTitle: true,
      actions: [IconButton(onPressed: onTap, icon: icon)],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}