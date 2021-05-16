import 'package:flutter/material.dart';

import 'ListView.dart';
import 'ImageView.dart';
import 'ProjectsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
      ),
      body: ListView(
        children: [
          Center(
            child: ElevatedButton(
              child: Text("List View Page"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListViewHome())
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text("Image View Page"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImageView())
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text("Projects Page"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProjectsHome())
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

