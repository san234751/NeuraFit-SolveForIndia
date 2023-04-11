import 'package:app/pages/AddExercise.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 10),
            Text(
              "Hello Sankit!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              "Thursday, 07 July",
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
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(27, 88, 91, 1),
        unselectedItemColor: const Color.fromRGBO(71, 71, 71, 1),
        backgroundColor: Colors.white,
        elevation: 0,
        onTap: (index) {
          if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>const AddExercise(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_gymnastics_rounded),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity, height: 30),
            Container(
              width: devicesize.width * 0.9,
              height: devicesize.height / 4,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 224, 180, 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
