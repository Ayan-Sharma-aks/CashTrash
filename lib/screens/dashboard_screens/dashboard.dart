import 'package:firebase_auth101/widgets/check_pincode.dart';
import 'package:flutter/material.dart';

import './history.dart';
import './pickup_req.dart';
import './homescreen.dart';
import './price_list.dart';

import '../../widgets/drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  List<Widget> dashboardScreens = [
    const HomeScreen(),
    const PriceList(),
    const CheckPincode(),
    const PickUpHistory(),
  ];

  List<String> titles = [
    'Home',
    'Prices',
    'Request Pickup',
    'History',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(titles[_currentIndex]),
      ),
      drawer: const MyDrawer(),
      body: dashboardScreens[_currentIndex],
      // body: Check(
      //   currentindex: _currentIndex,
      //   dashboardscreens: dashboardScreens,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        iconSize: 26,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.green[900],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            tooltip: 'Home',
            label: 'Home',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee),
            tooltip: 'Price',
            label: 'Price',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            tooltip: 'Request Pickup',
            label: 'Request',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            tooltip: 'History',
            label: 'History',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

// class Check extends StatefulWidget {
//   int currentindex;
//   List<Widget> dashboardscreens;

//   Check(
//       {required this.currentindex, required this.dashboardscreens, super.key});

//   @override
//   State<Check> createState() => _CheckState();
// }

// class _CheckState extends State<Check> {
//   @override
//   Widget build(BuildContext context) {
//     if (widget.currentindex != 2) {
//       return PickUpRequest();
//     } else {
//       return widget.dashboardscreens.elementAt(widget.currentindex);
//     }
//   }
// }
