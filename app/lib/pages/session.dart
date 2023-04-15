import 'package:app/pages/addexercise.dart';
import 'package:app/pages/homepage.dart';
import 'package:app/widget/card.dart';
import 'package:flutter/material.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({Key? key}) : super(key: key);
  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  List<String> pending = ["Running", "Bench press"];
  List<String> completed = ["Pushups"];
  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity, height: 30),
              Row(
                children: [
                  SizedBox(width: devicesize.width * 0.05),
                  const Text(
                    "New",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 36,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: devicesize.width * 0.05),
                  const Text(
                    "Session",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: devicesize.width * 0.05),
                  const Text(
                    "Completed",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: devicesize.width * 0.9,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(completed[index]),
                          trailing: const Icon(Icons.sports_handball),
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: devicesize.width * 0.05),
                  const Text(
                    "Pending",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: devicesize.width * 0.9,
                // height: devicesize.height * 0.1 * pending.length,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        PendingCard(
                          title: pending[index],
                          logo: Icons.sports_handball,
                          devicesize: devicesize,
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              ),
              Container(
                height: 50,
                width: devicesize.width * 0.9,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 224, 180, 1),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(),
                ),
                child: TextButton(
                  child: const Text(
                    "Add Exercise",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddExercise(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: devicesize.width * 0.9,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 94, 88, 1),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(),
                ),
                child: TextButton(
                  child: const Text(
                    "Cancel Session",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
