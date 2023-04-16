import 'package:firebase_auth/firebase_auth.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            FirebaseAuth.instance.currentUser!.displayName.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            FirebaseAuth.instance.currentUser!.email.toString(),
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
          onTap: () {},
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
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            // Logout
          },
        ),
      ],
    );
  }
}
