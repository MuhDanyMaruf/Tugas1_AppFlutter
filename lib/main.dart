import 'package:flutter/material.dart';

import 'ui/dashboard.dart' as dashboard;
import 'ui/insert.dart';
import 'ui/update.dart';
import 'ui/login.dart';

// Dummy list to store sales data globally
List<Map<String, String>> salesData = [];

// Main function to run the app
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Management System',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Home Page Widget
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Management System',
          style: TextStyle(
            fontWeight: FontWeight.bold, // menebalkan teks
            fontSize: 26.0, // ukuran font
          ),
        ),
        backgroundColor: Color.fromARGB(255, 136, 1, 255),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Center(
            child: Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              children: [
                // Dashboard button
                HomeButton(
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => dashboard.DashboardPage()),
                    );
                  },
                ),
                // Add button
                HomeButton(
                  icon: Icons.add,
                  label: 'Add',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddPage()),
                    );
                  },
                ),
                // Update button
                HomeButton(
                  icon: Icons.update,
                  label: 'Update',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdatePage()),
                    );
                  },
                ),
                // Logout button
                HomeButton(
                  icon: Icons.logout,
                  label: 'Logout',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          Center(
            child: Wrap(
              spacing: 20.0, // jarak horizontal antar elemen
              runSpacing: 20.0, // jarak vertikal antar elemen
              children: [
                Container(
                  margin: EdgeInsets.all(10), // mengatur margin
                  padding: EdgeInsets.all(16), // mengatur padding
                  child: const Text(
                    'Nama : Muh Dany Maruf Riadi\nNPM : 714220025',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                // Kamu bisa menambahkan elemen lain di dalam Wrap ini
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Widget for Home Buttons
class HomeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function() onTap;

  const HomeButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
