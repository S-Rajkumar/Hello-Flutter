import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() {
  return runApp(HelloFlutter());
}

class HelloFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Hello Flutter",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
