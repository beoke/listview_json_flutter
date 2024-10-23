/*import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "List View Data JSON",
    home: Home(
      data: List<String>.generate(300, (i) => "ini data Ke $i"),
    ),
  ));
}
 
// untuk menampilkan data menggunakan list Builder

class Home extends StatelessWidget {
  final List<String> data;
  Home({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "List view",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.widgets),
            title: Text(data[index]),
          );
        },
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    title: "List view",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> dataJSON = [];

  Future<void> ambildata() async {
    try {
      http.Response hasil = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"},
      );

      setState(() {
        dataJSON = json.decode(hasil.body);
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    ambildata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List data JSON"),
      ),
      body: ListView.builder(
        itemCount: dataJSON.isEmpty ? 0 : dataJSON.length,
        itemBuilder: (context, i) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(dataJSON[i]['title']),
            ),
          );
        },
      ),
    );
  }
}
