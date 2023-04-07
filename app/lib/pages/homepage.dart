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
      appBar: AppBar(
        title: const Text("hello sankit"),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 26),
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Camera'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        children: List.generate(
          4,
          (index) {
            return Container(
              width: devicesize.width / 2.2,
              height: devicesize.width / 2.2,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}
