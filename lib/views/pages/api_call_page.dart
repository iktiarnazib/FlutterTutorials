import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// 1) Fetch function
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

// 2) Model class based on your API screenshot
class Activity {
  final String activity;
  final double availability;
  final String type;
  final int participants;
  final double price;
  final String accessibility;
  final String duration;
  final bool kidFriendly;
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
      activity: json['activity'] as String? ?? '',
      availability: (json['availability'] as num?)?.toDouble() ?? 0.0,
      type: json['type'] as String? ?? '',
      participants: (json['participants'] as num?)?.toInt() ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      accessibility: json['accessibility'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      kidFriendly: json['kidFriendly'] as bool? ?? false,
      link: json['link'] as String? ?? '',
      key: json['key'] as String? ?? '',
    );
  }
}

void main() => runApp(const ApiCallPage());

// 3) App UI (similar to your Album example)
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

  void _reload() {
    setState(() {
      futureActivity = fetchActivity();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Activity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Random Activity'),
          actions: [
            IconButton(
              onPressed: _reload,
              icon: const Icon(Icons.refresh),
              tooltip: 'Get another activity',
            ),
          ],
        ),
        body: Center(
          child: FutureBuilder<Activity>(
            future: futureActivity,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final a = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            a.activity,
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          Text("Type: ${a.type}"),
                          Text("Participants: ${a.participants}"),
                          Text("Availability: ${a.availability}"),
                          Text("Price: ${a.price}"),
                          Text("Accessibility: ${a.accessibility}"),
                          Text("Duration: ${a.duration}"),
                          Text("Kid friendly: ${a.kidFriendly ? "Yes" : "No"}"),
                          const SizedBox(height: 8),
                          if (a.link.isNotEmpty) Text("Link: ${a.link}"),
                          Text("Key: ${a.key}"),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FilledButton.icon(
                              onPressed: _reload,
                              icon: const Icon(Icons.casino),
                              label: const Text("Randomize"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
