import 'package:flutter/material.dart';
import 'package:vibance/pages/home_page.dart';
import 'package:vibance/pages/playlist_page.dart';
import 'package:vibance/pages/search_page.dart';
import 'package:vibance/pages/settings_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainHomeState extends StatefulWidget {
  const MainHomeState({super.key});

  @override
  State<MainHomeState> createState() => _MainHomeStateState();
}

class _MainHomeStateState extends State<MainHomeState> {
  int _selectedIndex = 0;
  void navigateBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [
    UserHomePage(),
    UserSearchPage(),
    UserPlaylistPage(),
    UserSettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.grey.shade900,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: GNav(
            backgroundColor: Colors.grey.shade900,
            tabBackgroundColor: Color.fromARGB(255, 164, 35, 245),
            gap: 8,
            activeColor: Colors.white,
            color: Theme.of(context).colorScheme.primary,
            selectedIndex: _selectedIndex,
            onTabChange: navigateBar,
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
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
          ),
        ),
      ),
    );
  }
}
