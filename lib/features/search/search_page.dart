import 'package:flutter/material.dart';
import 'package:movie/constants/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(title: Text('Search'), backgroundColor: MyColors.backgroundColor),
      body: Center(child: Text('Search Page')),
    );
  }
}
