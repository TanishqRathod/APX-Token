import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investment_app/presentation/screens/Mixed%20Quick%20Actions/mixed_quick_actions.dart';
import 'package:investment_app/presentation/screens/My%20Tokens/my_tokens_screen.dart';
import 'package:investment_app/presentation/screens/widgets/custom_end_drawer.dart';
import '../home/home_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? userProfileImagePath;

  List<Widget> screens = [
    const HomeScreen(),
    const MyTokensScreen(),
    const MixedQuickActions(),
    const MyTokensScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          backgroundColor: Colors.black,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: userProfileImagePath != null
                    ? CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(userProfileImagePath!),
                )
                    : CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[800],
                  child: const Icon(CupertinoIcons.person, color: Colors.white, size: 30),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Lisa Smith",
                      style: TextStyle(
                          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400)),
                  Text("APX  0.00",
                      style: TextStyle(
                          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white, size: 30),
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
            ),
          ],
        ),
      ),

      /// ✅ Use your custom drawer
      endDrawer: const CustomEndDrawer(),

      body: screens[currentIndex],

      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        elevation: 10,
        shape: const CircularNotchedRectangle(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(color: Color(0xff2A983D)),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTabItem(icon: CupertinoIcons.home, index: 0),
                  buildTabItem(icon: Icons.info_outline, index: 1),
                  buildTabItem(icon: FontAwesomeIcons.inbox, index: 2),
                  buildTabItem(icon: CupertinoIcons.person, index: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabItem({required IconData icon, required int index}) {
    bool isSelected = index == currentIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Icon(icon,
          size: 30,
          color: isSelected ? const Color(0xff2A983D) : Colors.white60),
    );
  }
}
