import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> data;
  final Map<String, dynamic>? deviceInfo;
  final Position? location;
  final String? errorMessage;

  DetailsPage({
    required this.data,
    required this.deviceInfo,
    required this.location,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (errorMessage != null) _buildErrorSection(),
              if (errorMessage == null) ...[
                _buildUserInputSection(),
                _buildDeviceInfoSection(),
                _buildLocationSection(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorSection() {
    return Card(
      elevation: 4,
      color: Colors.red[50],
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Error:",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 8),
            Text(errorMessage!,
                style: TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInputSection() {
    return Card(
      elevation: 4,
      color: Colors.blueGrey[50],
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "User Input:",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            SizedBox(height: 8),
            _buildListTile("Name", data['name']),
            _buildListTile("Contact Number", data['number']),
            _buildListTile("Date of Birth", data['dob']),
            _buildListTile("Stream", data['dropdownValue']),
            _buildListTile("Blood Group", data['bloodGroup']),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceInfoSection() {
    return Card(
      elevation: 4,
      color: Colors.green[50],
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Device Info:",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(height: 8),
            if (deviceInfo != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildListTile("Model", deviceInfo?['model']),
                  _buildListTile("Manufacturer", deviceInfo?['manufacturer']),
                  _buildListTile("OS", deviceInfo?['operatingSystem']),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationSection() {
    return Card(
      elevation: 4,
      color: Colors.orange[50],
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location:",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            SizedBox(height: 8),
            if (location != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildListTile("Latitude", location?.latitude.toString()),
                  _buildListTile("Longitude", location?.longitude.toString()),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String? subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
      subtitle: Text(
        subtitle ?? 'Not Available',
        style: TextStyle(fontSize: 16, color: Colors.black54),
      ),
    );
  }
}
