import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> imageData = [];

  Future<void> getDATA() async {
    final responseDATA = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (responseDATA.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(responseDATA.body);

      setState(() {
        imageData = jsonData.cast<Map<String, dynamic>>();
      });
    } else {
      // Handle error here
      print('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    getDATA();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery App'),
      ),
      body: ListView.separated(
        itemCount: imageData.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(imageData[index]['thumbnailUrl']??''),
            title: Text(imageData[index]['title']??''),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1);
        },
      ),
    );
  }
}
