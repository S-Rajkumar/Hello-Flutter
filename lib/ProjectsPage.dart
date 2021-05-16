import 'package:flutter/material.dart';
import 'projects/json_image_list_and_grid_view/HomePage.dart';

class ProjectsHome extends StatefulWidget {
  @override
  _ProjectsHomeState createState() => _ProjectsHomeState();
}

class _ProjectsHomeState extends State<ProjectsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projects Home"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("WA Stickers Demo 1"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          )
        ],
      ),
    );
  }
}
