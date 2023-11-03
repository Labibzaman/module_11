import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:module_11/weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final jsonName = '''
  [
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3
    }
  ]
  ''';

  List<Weather> weatherList = [];

  @override
  void initState() {
    super.initState();
    final jsonData = json.decode(jsonName);
    weatherList = jsonData.map<Weather>((item) => Weather.fromJson(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Information'),
        ),
        body: ListView.builder(
          itemCount: weatherList.length,
          itemBuilder: (context, index) {
            final weather = weatherList[index];
            return Card(
              child: ListTile(
                title: Text(weather.city),
                subtitle: Text(
                  'Temperature: ${weather.temperature}°C\nCondition: ${weather.condition}\nHumidity: ${weather.humidity}%\nWind Speed: ${weather.windSpeed} km/h',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
