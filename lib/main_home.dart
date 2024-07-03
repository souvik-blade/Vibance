import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibance/pages/home_page.dart';
import 'package:vibance/pages/playlist_page.dart';
import 'package:vibance/pages/search_page.dart';
import 'package:vibance/pages/settings_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'themes/theme_provider.dart';

class MainHomeState extends StatefulWidget {
  const MainHomeState({super.key});

  @override
  State<MainHomeState> createState() => _MainHomeStateState();
}

class _MainHomeStateState extends State<MainHomeState> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _pages = const [
    UserHomePage(),
    UserSearchPage(),
    UserPlaylistPage(),
    UserSettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 13,
        child: GNav(
            backgroundColor: isDarkMode
                ? ThemeData.dark().copyWith().scaffoldBackgroundColor
                : ThemeData.light().copyWith().scaffoldBackgroundColor,
            tabBackgroundColor: const Color.fromARGB(255, 164, 35, 245),
            gap: 8,
            // activeColor: Colors.white,
            color: Theme.of(context).colorScheme.primary,

            // activeColor: Color(0XFF9e8cf2),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            tabMargin: const EdgeInsets.all(10),
            duration: const Duration(milliseconds: 500),
            tabBorderRadius: 24,
            textStyle: const TextStyle(fontWeight: FontWeight.w300),
            // tabBackgroundColor: isDarkMode
            //     ? ThemeData.dark().copyWith().highlightColor
            //     : ThemeData.light().copyWith().highlightColor,
            tabs: const [
              GButton(
                icon: Icons.home_filled,
                text: "Home",
              ),
              GButton(
                icon: Icons.search_rounded,
                text: "Search",
              ),
              GButton(
                icon: Icons.library_music_outlined,
                text: "Playlist",
              ),
              GButton(
                icon: Icons.menu_rounded,
                text: "Profile",
              ),
            ],
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn);
              });
            }),
      ),
    );
  }
}
