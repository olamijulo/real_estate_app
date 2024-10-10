import 'package:flutter/material.dart';
import 'package:real_estate_app/app/common/app_assets.dart';
import 'package:real_estate_app/app/common/app_colors.dart';
import 'package:real_estate_app/feature/chat/chat_screen.dart';
import 'package:real_estate_app/feature/favorites/favorites_screen.dart';
import 'package:real_estate_app/feature/home/home_screen.dart';
import 'package:real_estate_app/feature/profile/profile_screen.dart';
import 'package:real_estate_app/feature/search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    const SearchScreen(),
    const ChatScreen(),
    const HomeScreen(),
    const FavoritesScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _pages[_selectedIndex],
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 250.0,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: black, borderRadius: BorderRadius.circular(40.0)),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: Container(
                      height: _selectedIndex == 0 ? 45.0 : 40.0,
                      width: _selectedIndex == 0 ? 45.0 : 40.0,
                      decoration: BoxDecoration(
                          color: _selectedIndex == 0 ? orange : black50,
                          shape: BoxShape.circle),
                      child: Image.asset(
                        AppAssets.searchIcon,
                        scale: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Container(
                      height: _selectedIndex == 1 ? 45.0 : 40.0,
                      width: _selectedIndex == 1 ? 45.0 : 40.0,
                      decoration: BoxDecoration(
                          color: _selectedIndex == 1 ? orange : black50,
                          shape: BoxShape.circle),
                      child: Image.asset(
                        AppAssets.chatIcon,
                        scale: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    child: Container(
                      height: _selectedIndex == 2 ? 45.0 : 40.0,
                      width: _selectedIndex == 2 ? 45.0 : 40.0,
                      decoration: BoxDecoration(
                          color: _selectedIndex == 2 ? orange : black50,
                          shape: BoxShape.circle),
                      child: Image.asset(
                        AppAssets.homeIcon,
                        scale: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                    child: Container(
                      height: _selectedIndex == 3 ? 45.0 : 40.0,
                      width: _selectedIndex == 3 ? 45.0 : 40.0,
                      decoration: BoxDecoration(
                          color: _selectedIndex == 3 ? orange : black50,
                          shape: BoxShape.circle),
                      child: Image.asset(
                        AppAssets.favoriteIcon,
                        scale: 28.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 4;
                      });
                    },
                    child: Container(
                      height: _selectedIndex == 4 ? 45.0 : 40.0,
                      width: _selectedIndex == 4 ? 45.0 : 40.0,
                      decoration: BoxDecoration(
                          color: _selectedIndex == 4 ? orange : black50,
                          shape: BoxShape.circle),
                      child: Image.asset(
                        AppAssets.userIcon,
                        scale: 28.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]), // Display the selected page
    );
  }
}
