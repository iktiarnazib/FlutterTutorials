import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Activity> fetchActivity() async {
  final response = await http.get(
    Uri.parse('https://bored-api.appbrewery.com/random'),
  );

  if (response.statusCode == 200) {
    return Activity.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load activity');
  }
}

class Activity {
  final String activity;
  final double availability; // number in API
  final String type;
  final int participants;
  final double price;
  final String accessibility; // string in API
  final String duration; // string in API
  final bool kidFriendly; // bool in API
  final String link;
  final String key;

  const Activity({
    required this.activity,
    required this.availability,
    required this.type,
    required this.participants,
    required this.price,
    required this.accessibility,
    required this.duration,
    required this.kidFriendly,
    required this.link,
    required this.key,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json['activity'] as String,
      availability: (json['availability'] as num).toDouble(),
      type: json['type'] as String,
      participants: json['participants'] as int,
      price: (json['price'] as num).toDouble(),
      accessibility: json['accessibility'] as String,
      duration: json['duration'] as String,
      kidFriendly: json['kidFriendly'] as bool,
      link: (json['link'] ?? '') as String,
      key: json['key'] as String,
    );
  }
}

void main() => runApp(const ApiCallPage());

class ApiCallPage extends StatefulWidget {
  const ApiCallPage({super.key});
  @override
  State<ApiCallPage> createState() => _ApiCallPageState();
}

class _ApiCallPageState extends State<ApiCallPage> {
  late Future<Activity> futureActivity;

  @override
  void initState() {
    super.initState();
    futureActivity = fetchActivity();
  }

  void _refreshActivity() {
    setState(() {
      futureActivity = fetchActivity();
    });
  }

  bool showFirst = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bored API Fetch Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Random Activity'),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _refreshActivity,
              tooltip: 'Refresh',
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    showFirst = !showFirst;
                  });
                },
                child: Icon(Icons.casino),
              ),
              FutureBuilder<Activity>(
                future: futureActivity,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: AnimatedCrossFade(
                        firstChild: Card(
                          elevation: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.activity,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 12),

                                Text("Type: ${data.type}"),
                                Text("Participants: ${data.participants}"),
                                Text("Price: ${data.price}"),
                                Text("Availability: ${data.availability}"),
                                Text("Accessibility: ${data.accessibility}"),
                                Text("Duration: ${data.duration}"),
                                Text("Kid Friendly: ${data.kidFriendly}"),
                                Text("Key: ${data.key}"),

                                if (data.link.isNotEmpty) ...[
                                  const SizedBox(height: 8),
                                  Text(
                                    "Link: ${data.link}",
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                ],

                                const SizedBox(height: 16),
                                ElevatedButton.icon(
                                  label: Text('Get Another Activity'),
                                  onPressed: _refreshActivity,
                                  icon: Icon(Icons.casino),
                                ),
                              ],
                            ),
                          ),
                        ),
                        secondChild: Image.asset('assets/images/new.jpeg'),
                        crossFadeState: showFirst
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }

                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
