import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'general_collection_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedPage=2;
  final _screens=[
    const GeneralCollectionPage(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _screens[selectedPage],
      bottomNavigationBar: CurvedNavigationBar(

        color: const Color.fromARGB(255, 1, 10, 56),
        buttonBackgroundColor: const Color.fromARGB(255, 1, 10, 56),
        backgroundColor: Colors.transparent,
        height: 60,
        items: const [

          Icon(Icons.chat, size: 30,color: Colors.white),
          Icon(Icons.list, size: 30,color: Colors.white),
          Icon(Icons.home_filled, size: 30,color: Colors.white),
          Icon(Icons.compare_arrows, size: 30,color: Colors.white),
        ],
        index: selectedPage,
        onTap: (index) {

          setState(() {
            selectedPage = index;
          });
        },
        animationDuration: const Duration(
            milliseconds: 600
        ),
        animationCurve: Curves.easeOutExpo,
      ),
    );
  }
}
