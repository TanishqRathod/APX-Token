import 'package:flutter/material.dart';

import '../login/login_screen.dart';

class BoardingScreen extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/boarding_1.png",
      "title": "Invest With Us",
      "subtitle": "Increase Your\nInvestment With Us"
    },
    {
      "image": "assets/images/boarding_2.png",
      "title": "Trusted & Secure",
      "subtitle": "500.000 investors\nchoose APX Token"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length + 1, // +1 for the login screen
        onPageChanged: (index) => setState(() => _currentPage = index),
        itemBuilder: (context, index) {
          if (index == 2) {
            return LoginScreen();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 330,
                  child: Image.asset(
                    pages[index]['image']!,fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  pages[index]['title']!,
                  style: TextStyle(
                    color: Color(0xff2A983D),
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  pages[index]['subtitle']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length + 1,
                        (dotIndex) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == dotIndex
                            ? Color(0xff2A983D)
                            : Color(0xff2A983D).withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
