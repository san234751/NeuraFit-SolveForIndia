import 'package:flutter/material.dart';

class AddExercise extends StatefulWidget {
  const AddExercise({Key? key}) : super(key: key);
  @override
  State<AddExercise> createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  List<String> names = ["Plank", "Running", "Bench press", "Pushups"];
  List<String> selected = [];
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
                  SizedBox(width: devicesize.width * 0.1),
                  const Text(
                    "Add",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 36,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: devicesize.width * 0.1),
                  const Text(
                    "Exercise",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: devicesize.width * 0.9,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    hintText: '       Search for exercise',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Colors.grey,
                    ),
                    suffixIcon: const Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: devicesize.width * 0.9,
                height: devicesize.height * 0.6,
                child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selected.contains(names[index])) {
                                selected.remove(names[index]);
                              } else {
                                selected.add(names[index]);
                              }
                            });
                          },
                          child: ListTile(
                            title: Text(names[index]),
                            trailing: const Icon(Icons.sports_handball),
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: selected.contains(names[index])
                                      ? Colors.green
                                      : Colors.black,
                                  width: selected.contains(names[index])
                                      ? 2.0
                                      : 1.0),
                            ),
                          ),
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
                    "Done",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(
                      selected,
                    );
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
