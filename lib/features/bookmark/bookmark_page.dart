import 'package:flutter/material.dart';
import 'package:movie/constants/colors.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(title: Text('Watchlist'),backgroundColor: MyColors.backgroundColor),
      body: Center(child: Text('Watchlist Page')),
    );
  }
}
