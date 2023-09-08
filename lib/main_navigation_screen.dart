import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:moip/features/camera/camera_screen.dart';
import 'package:moip/features/home/home_screen.dart';
import 'package:moip/features/profile/profile_screen.dart';
import 'package:moip/features/search/search_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 2;

  final screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CameraScreen(),
    const ProfileScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onTap,
          destinations: [
            NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.house,
                color: _selectedIndex == 0
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
              ),
              label: "HOME",
            ),
            NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: _selectedIndex == 1
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
              ),
              label: "SEARCH",
            ),
            NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.camera,
                color: _selectedIndex == 2
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
              ),
              label: "CAMERA",
            ),
            NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.solidUser,
                color: _selectedIndex == 3
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
              ),
              label: "PROFILE",
            ),
          ],
        ));
  }
}
