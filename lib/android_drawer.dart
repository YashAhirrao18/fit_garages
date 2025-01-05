import 'package:flutter/material.dart';

class AndroidDrawer extends StatelessWidget {
  final Function(String title, IconData icon) onItemSelected;

  const AndroidDrawer({Key? key, required this.onItemSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DrawerItem> drawerItems = [
      DrawerItem(
        icon: Icons.home,
        title: 'Home',
        onTap: () => onItemSelected('Home', Icons.home),
      ),
      DrawerItem(
        icon: Icons.person,
        title: 'Profile',
        onTap: () => onItemSelected('Profile', Icons.person),
      ),
      DrawerItem(
        icon: Icons.settings,
        title: 'Settings',
        onTap: () => onItemSelected('Settings', Icons.settings),
      ),
      DrawerItem(
        icon: Icons.notifications,
        title: 'Notifications',
        onTap: () => onItemSelected('Notifications', Icons.notifications),
      ),
      DrawerItem(
        icon: Icons.help,
        title: 'Help',
        onTap: () => onItemSelected('Help', Icons.help),
      ),
    ];

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/profileicon.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome, User!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: drawerItems.length,
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.grey),
              itemBuilder: (context, index) {
                final item = drawerItems[index];
                return ListTile(
                  leading: Icon(item.icon, color: Colors.blue),
                  title: Text(item.title),
                  onTap: () {
                    Navigator.pop(context);
                    item.onTap();
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
