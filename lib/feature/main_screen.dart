import 'package:flutter/material.dart';
import 'package:real_estate_app/app/common/app_assets.dart';
import 'package:real_estate_app/app/common/app_colors.dart';
import 'package:real_estate_app/feature/chat/chat_screen.dart';
import 'package:real_estate_app/feature/favorites/favorites_screen.dart';
import 'package:real_estate_app/feature/home/home_screen.dart';
import 'package:real_estate_app/feature/profile/profile_screen.dart';
import 'package:real_estate_app/feature/search/search_screen.dart';
import 'package:real_estate_app/widget/custom_navbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    const SearchScreen(),
    const ChatScreen(),
    const HomeScreen(),
    const FavoritesScreen(),
    const ProfileScreen()
  ];

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _pages[_selectedIndex],
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 2), // Start below screen
                end: Offset.zero, // End at original position
              ).animate(_animation),
              child: Container(
                width: 250.0,
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: black, borderRadius: BorderRadius.circular(40.0)),
                child: Row(
                  children: [
                    CutomNavItem(
                        value: 0,
                        selectedIndex: _selectedIndex,
                        imgUrl: AppAssets.searchIcon,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        }),
                    const Spacer(),
                    CutomNavItem(
                        value: 1,
                        selectedIndex: _selectedIndex,
                        imgUrl: AppAssets.chatIcon,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        }),
                    const Spacer(),
                    CutomNavItem(
                        value: 2,
                        selectedIndex: _selectedIndex,
                        imgUrl: AppAssets.homeIcon,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        }),
                    const Spacer(),
                    CutomNavItem(
                        value: 3,
                        selectedIndex: _selectedIndex,
                        imgUrl: AppAssets.favoriteIcon,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 3;
                          });
                        }),
                    const Spacer(),
                    CutomNavItem(
                        value: 4,
                        selectedIndex: _selectedIndex,
                        imgUrl: AppAssets.userIcon,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 4;
                          });
                        }),
                  ],
                ),
              ),
            ),
          ),
        )
      ]), // Display the selected page
    );
  }
}
