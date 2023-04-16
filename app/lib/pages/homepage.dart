import 'package:app/pages/notification.dart';
import 'package:app/pages/graph_page.dart';
import 'package:app/pages/main_screen.dart';
import 'package:app/pages/profile_page.dart';
import 'package:app/pages/session_page.dart';
import 'package:app/pages/workouts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<String> month = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Nov',
    'Dec'
  ];

  List<String> week = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  DateTime date = DateTime.now();
  final List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    WorkOutPage(),
    SessionPage(),
    GraphPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    initializeDateFormatting();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Hello ${FirebaseAuth.instance.currentUser!.displayName.toString().split(' ')[0]}!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "${week[date.weekday - 1]}, ${date.day} ${month[date.month - 1]}",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.circle_notifications_outlined,
                size: 36,
                color: Colors.black,
              ),
              onPressed: () {
                // Navigate to notifications page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationPage(),
                  ),
                );
              },
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color.fromRGBO(27, 88, 91, 1),
          unselectedItemColor: const Color.fromRGBO(71, 71, 71, 1),
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          elevation: 0,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_handball),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: Color.fromRGBO(255, 94, 88, 1),
                size: 40,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.paste,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: '',
            ),
          ],
        ),
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ));
  }
}
