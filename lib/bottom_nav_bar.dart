import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavBar extends StatefulWidget {
  final Function(String title, IconData icon) onItemSelected;

  const BottomNavBar({Key? key, required this.onItemSelected})
      : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 2;
  final List<_NavBarItem> _navBarItems = [
    _NavBarItem(icon: Icons.contact_mail, title: "Contact"),
    _NavBarItem(icon: Icons.list, title: "List"),
    _NavBarItem(icon: Icons.add, title: "Add"),
    _NavBarItem(icon: Icons.call, title: "Call"),
    _NavBarItem(icon: Icons.perm_identity, title: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: _currentIndex,
      height: 65.0,
      items: _navBarItems
          .map((item) => Icon(
                item.icon,
                size: 33,
                color: Colors.blue,
              ))
          .toList(),
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.blue,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        widget.onItemSelected(
          _navBarItems[index].title,
          _navBarItems[index].icon,
        );
      },
    );
  }
}

class _NavBarItem {
  final IconData icon;
  final String title;

  _NavBarItem({required this.icon, required this.title});
}
