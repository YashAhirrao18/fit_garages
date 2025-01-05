import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fit_garages/dynamic_widget.dart';
import 'android_drawer.dart';
import 'bottom_nav_bar.dart';
import 'scrolling_banner.dart'; // Import the scrolling banner widget

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedTitle = "Home";
  IconData _selectedIcon = Icons.home;

  // Corrected list of banner items with heading, subheading, and image URL
  final List<Map<String, String>> bannerItems = [
    {
      'heading': 'Welcome to FitGarages',
      'subheading': 'Your trusted digital automobile repair platform',
      'image': "assets/images/banner1.png"
    },
    {
      'heading': 'Latest Updates',
      'subheading': 'New features added for a seamless experience',
      'image': "assets/images/banner2.png"
    },
    {
      'heading': 'Check New Profiles',
      'subheading': 'Manage your service requests and track repairs',
      'image': "assets/images/banner3.png"
    },
    {
      'heading': 'Customer Support',
      'subheading': 'Get 24/7 support with just a click',
      'image': "assets/images/banner4.png"
    },
  ];

  void _updateSelectedItem(String title, IconData icon) {
    setState(() {
      _selectedTitle = title;
      _selectedIcon = icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 10),
            Text(
              _selectedTitle,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 5,
      ),
      drawer: Platform.isAndroid
          ? AndroidDrawer(onItemSelected: _updateSelectedItem)
          : null,
      bottomNavigationBar: Platform.isIOS
          ? BottomNavBar(onItemSelected: _updateSelectedItem)
          : null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[100]!,
              Colors.blue[200]!
            ], // Adjusted color to better match the banner
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            // Horizontal scrolling banner (using the separate widget)
            ScrollingBanner(bannerItems: bannerItems),
            SizedBox(
              height: 20,
            ),
            // Main content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Introduction Text with Card style
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            child: Column(
                              children: [
                                Icon(
                                  _selectedIcon,
                                  size: 100,
                                  color: Colors.blueAccent,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  _selectedTitle,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'Your trusted automobile repair platform. Explore, book, and track services with ease.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Actionable Section Cards arranged in 3x3 grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 8, // Number of items in the grid
                      itemBuilder: (context, index) {
                        // Assign different cards based on index
                        List<Map<String, dynamic>> actionItems = [
                          {
                            'icon': Icons.build,
                            'title': 'Explore Services',
                            'onTap': () {},
                          },
                          {
                            'icon': Icons.assignment,
                            'title': 'Book Repairs',
                            'onTap': () {},
                          },
                          {
                            'icon': Icons.support_agent,
                            'title': 'Customer Support',
                            'onTap': () {},
                          },
                          {
                            'icon': Icons.account_circle,
                            'title': 'Manage Profiles',
                            'onTap': () {},
                          },
                          {
                            'icon': Icons.search,
                            'title': 'Search Services',
                            'onTap': () {},
                          },
                          {
                            'icon': Icons.history,
                            'title': 'View History',
                            'onTap': () {},
                          },
                          {
                            'icon': Icons.notifications,
                            'title': 'Notifications',
                            'onTap': () {},
                          },
                          {
                            'icon': Icons.star,
                            'title': 'Rate Services',
                            'onTap': () {},
                          },
                        ];

                        var item = actionItems[index];

                        return _buildActionCard(
                          icon: item['icon'],
                          title: item['title'],
                          onTap: item['onTap'],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialog(context),
        child: Icon(Icons.add),
        tooltip: "Add something",
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  Widget _buildActionCard(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.blueAccent),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Rounded corners
        ),
        elevation: 24.0, // Shadow effect
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Use the minimum space needed
            children: [
              // Icon at the top of the dialog
              Icon(
                Icons.person_add,
                size: 40,
                color: Colors.blueAccent,
              ),
              SizedBox(height: 10),
              // Title of the dialog
              Text(
                "Create User Profiles",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              // Content text of the dialog
              Text(
                "Do you want to create user profiles?",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Buttons container: Stretch buttons across the full width
              Row(
                children: [
                  // Cancel button (stretching to left side)
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      style: TextButton.styleFrom(
                        side: BorderSide(
                            color: Colors.blueAccent), // Border color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Space between buttons
                  // Yes button (stretching to right side)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(); // Close the dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DynamicWidgetPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.blueAccent, // Button background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
