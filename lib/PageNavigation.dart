import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page One"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go Page Two"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageTwo())
            );
          },
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Two"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go Back"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageOne())
            );
          },
        ),
      ),
    );
  }
}

