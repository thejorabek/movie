import 'package:flutter/material.dart';
import 'package:movie/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'What do you want to watch?',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: MyColors.backgroundColor,
      ),
      body: Column(
        children: [
          SearchBar(),
          // MovieGrid(),
          // CategoryTabs(),
        ],
      ),
    );
  }
}
