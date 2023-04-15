import 'package:app/pages/plan_screen.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/img1.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'johndoe@example.com',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 16),
        ListTile(
          leading: Icon(Icons.fitness_center),
          title: Text('Workout Plan'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SetAlarmScreen();
            }));
          },
        ),
        ListTile(
          leading: Icon(Icons.food_bank),
          title: Text('Nutrition Plan'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to nutrition plan page
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to settings page
          },
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              // Navigate to login page
            },
            child: Text('Logout'),
          ),
        ),
      ],
    );
  }
}
