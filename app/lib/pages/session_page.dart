import 'package:app/pages/add_exercise.dart';
import 'package:app/widget/card.dart';
import 'package:flutter/material.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({Key? key}) : super(key: key);
  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  List<String> pending = [];
  List<String> completed = [];
  addComplete(String value) {
    setState(() {
      pending.remove(value);
      completed.add(value);
    });
  }

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: devicesize.width * 0.05),
                    child: const Text(
                      "New",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 36,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: devicesize.width * 0.05),
                    child: Container(
                      width: devicesize.width * 0.2,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 94, 88, 1),
                        // color: const Color.fromRGBO(255, 224, 180, 1),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(),
                      ),
                      child: TextButton(
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
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
                  itemCount: completed.length,
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
                  itemCount: pending.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        PendingCard(
                          title: pending[index],
                          logo: Icons.sports_handball,
                          devicesize: devicesize,
                          callback: addComplete,
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
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(),
                ),
                child: TextButton(
                  child: const Text(
                    "Add Exercise",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    //get data on pop
                    Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (context) => const AddExercise(),
                          ),
                        )
                        .then((value) => setState(() {
                              pending = pending + value;
                            }));
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: devicesize.width * 0.9,
                decoration: BoxDecoration(
                  // color: const Color.fromRGBO(255, 94, 88, 1),
                  color: const Color.fromRGBO(255, 224, 180, 1),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(),
                ),
                child: TextButton(
                  child: const Text(
                    "Done Session",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
