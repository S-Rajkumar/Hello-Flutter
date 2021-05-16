import 'package:flutter/material.dart';

class ListViewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Home"),
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StaticListView()));
              }, child: Text("Static List View")),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DynamicListView()));
              }, child: Text("Builder List View")),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => InfiniteListView()));
              }, child: Text("Infinite List View")),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SeperatedListView()));
              }, child: Text("Seperated List View")),
            ],
          ),
        ),
      ),
    );
  }
}

class SeperatedListView extends StatelessWidget {
  final ListItems = <String>["Item1", "Item2", "Item3", "item4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seperated List View"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView.separated(
            itemBuilder: (contect, int index){
              return ListTile(
                title: Text(ListItems[index]),
              );
        }, separatorBuilder: (context, index){
              return Divider();
        }, itemCount: ListItems.length),
      ),
    );
  }
}


class InfiniteListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite List View"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index){
              return Center(
                child: ListTile(
                  title: Text("Item $index"),
                ),
              );
            },
        ),
      ),
    );
  }
}


class DynamicListView extends StatelessWidget {
  final listItems = <String>['item 1', 'Item 2', 'Item 3'];
  final colorStrength = <int>[500, 300, 100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(13),
          itemCount: listItems.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: 50,
              color: Colors.blue[colorStrength[index]],
              child: Center(
                child: Text(listItems[index]),
              ),
            );
          }
      ),
    );
  }
}


class StaticListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: Container(
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Container(
                height: 50,
                color: Colors.blue[500],
                child: Center(
                  child: Text("Item 1"),
                ),
              ),
              Container(
                height: 50,
                color: Colors.blue[300],
                child: Center(
                  child: Text("Item 2"),
                ),
              ),
              Container(
                height: 50,
                color: Colors.blue[100],
                child: Center(
                  child: Text("Item 3"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
