// ignore_for_file: unnecessary_null_comparison

import 'package:device_info_plus/device_info_plus.dart';
import 'package:fit_garages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class DynamicWidgetPage extends StatefulWidget {
  const DynamicWidgetPage({super.key});

  @override
  _DynamicWidgetPageState createState() => _DynamicWidgetPageState();
}

class _DynamicWidgetPageState extends State<DynamicWidgetPage> {
  List<Map<String, dynamic>> widgetsData = [];
  final List<String> dropdownOptions = ['Science', 'Commerce', 'Arts'];
  final List<String> bloodGroupOptions = [
    'A+',
    'B+',
    'O+',
    'AB+',
    'A-',
    'B-',
    'O-',
    'AB-'
  ];

  void _addWidget() {
    setState(() {
      widgetsData.add({
        'name': '',
        'number': '',
        'dob': '',
        'dropdownValue': dropdownOptions[0],
        'bloodGroup': bloodGroupOptions[0],
      });
    });
  }

  void _removeWidget(int index) {
    setState(() {
      widgetsData.removeAt(index);
    });
  }

  // Function to request location permission
  Future<bool> _requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  // Function to show a loading dialog
  Future<void> _showLoadingDialog() async {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog from being dismissed manually
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16),
                Text("Loading..."),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to navigate to details page with data
  void _navigateToDetailsPage(Map<String, dynamic> data) async {
    // Show loading dialog
    await _showLoadingDialog();

    bool hasPermission = await _requestLocationPermission();

    if (hasPermission) {
      final deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.deviceInfo;
      final location = await Geolocator.getCurrentPosition();

      // Dismiss loading dialog
      Navigator.of(context).pop(); // Close the dialog

      if (deviceInfo == null || location == null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              data: data,
              deviceInfo: null,
              location: null,
              errorMessage: 'Failed to fetch device info or location.',
            ),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              data: data,
              deviceInfo: deviceInfo.toMap(),
              location: location,
              errorMessage: null,
            ),
          ),
        );
      }
    } else {
      // Dismiss loading dialog
      Navigator.of(context).pop(); // Close the dialog

      // Permission not granted, show error message
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(
            data: data,
            deviceInfo: null,
            location: null,
            errorMessage:
                'Location permission is required to view the details.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Widgets"),
        backgroundColor: Colors.blueAccent, // Custom color for AppBar
      ),
      body: widgetsData.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.person_add_alt_1, size: 80, color: Colors.grey),
                    SizedBox(height: 20),
                    Text(
                      "You can create user profiles dynamically.",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            )
          : ListView.builder(
              itemCount: widgetsData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _navigateToDetailsPage(widgetsData[index]),
                  child: Card(
                    elevation: 8.0,
                    margin: EdgeInsets.all(12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Profile Image
                          CircleAvatar(
                            radius: 40.0,
                            backgroundImage: AssetImage(
                                'assets/images/profileicon.png'), // Use your profile icon here
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Name field
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    hintText: 'Enter your full name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    widgetsData[index]['name'] = value;
                                  },
                                ),
                                SizedBox(height: 8.0),
                                // Contact Number
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Contact Number',
                                    hintText: 'Enter your phone number',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value) {
                                    widgetsData[index]['number'] = value;
                                  },
                                ),
                                SizedBox(height: 8.0),
                                // Date of Birth
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Date of Birth',
                                    hintText: 'Enter your birth date',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.datetime,
                                  onChanged: (value) {
                                    widgetsData[index]['dob'] = value;
                                  },
                                ),
                                SizedBox(height: 8.0),
                                // Dropdown for Stream selection
                                DropdownButtonFormField<String>(
                                  value: widgetsData[index]['dropdownValue'],
                                  decoration: InputDecoration(
                                    labelText: 'Stream',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  items: dropdownOptions.map((String option) {
                                    return DropdownMenuItem<String>(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      widgetsData[index]['dropdownValue'] =
                                          value!;
                                    });
                                  },
                                ),
                                SizedBox(height: 8.0),
                                // Dropdown for Blood Group
                                DropdownButtonFormField<String>(
                                  value: widgetsData[index]['bloodGroup'],
                                  decoration: InputDecoration(
                                    labelText: 'Blood Group',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  items: bloodGroupOptions.map((String option) {
                                    return DropdownMenuItem<String>(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      widgetsData[index]['bloodGroup'] = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          // Delete Icon
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _removeWidget(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addWidget,
        child: Icon(Icons.add),
        tooltip: "Add Widget",
      ),
    );
  }
}
