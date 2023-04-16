import 'dart:convert';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<dynamic>> _logs;

  @override
  void initState() {
    super.initState();
    _logs = fetchLogs();
  }

  Future<List<dynamic>> fetchLogs() async {
    final response =
        await http.get(Uri.parse('https://sfi-backend.onrender.com/session/1'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['result'];
    } else {
      throw Exception('Failed to fetch logs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime(DateTime.now().year, 1, 1),
          lastDate: DateTime(
              DateTime.now().add(const Duration(hours: 24)).year,
              DateTime.now().add(const Duration(hours: 24)).month,
              DateTime.now().add(const Duration(hours: 24)).day),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Colors.blueGrey,
          dayColor: Colors.black54,
          activeDayColor: const Color.fromRGBO(255, 224, 180, 1),
          activeBackgroundDayColor: Colors.black,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => date.day <= DateTime.now().day,
          locale: 'en_ISO',
        ),
        SizedBox(height: 20),
        Expanded(
          child: FutureBuilder<List<dynamic>>(
            future: _logs,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final logs = snapshot.data!;
                return ListView.builder(
                  itemCount: logs.length,
                  itemBuilder: (context, index) {
                    final log = logs[index];
                    return ListTile(
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: log['exercises'].length,
                            itemBuilder: (context, index) {
                              final exercise = log['exercises'][index];
                              var reps = "";
                              if (exercise['type'] != "cardio") {
                                for (var elem in exercise['metadata']['reps']) {
                                  reps += '$elem ';
                                }
                              }
                              return ListTile(
                                title: Text(exercise['metadata']['name']),
                                subtitle: (exercise['type'] == 'cardio'
                                    ? Text(
                                        'Duration: ${exercise['metadata']['duration']}s')
                                    : Text(
                                        'Sets: ${exercise['metadata']['reps'].length} Reps: $reps')),
                                trailing: (exercise['type'] == 'cardio'
                                    ? Icon(Icons.sports_handball)
                                    : Icon(Icons.sports_kabaddi)),
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error fetching details'),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
