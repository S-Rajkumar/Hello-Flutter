import 'dart:convert';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String,dynamic>> stickerPacks = [];
  Future<void> loadJsonData(jsonFilePath) async {
    String data = await DefaultAssetBundle.of(context).loadString(jsonFilePath);
    final _jsonData = json.decode(data);
    for(int index=0; index < _jsonData["sticker_packs"].length; index++){
      stickerPacks.add(_jsonData["sticker_packs"][index]);
    }
    setState(() {
      stickerPacks = stickerPacks;
    });
  }

  @override
  void initState() {
    loadJsonData("lib/projects/json_image_list_and_grid_view/sticker_packs/sticker_packs.json");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomePageListView(stickerPacks);
  }
}

class HomePageListView extends StatefulWidget {
  List<Map<String, dynamic>> stickerPacks;
  HomePageListView(List<Map<String, dynamic>> stickerPakcs){
    this.stickerPacks = stickerPakcs;
  }

  @override
  _HomePageListViewState createState() => _HomePageListViewState();
}

class _HomePageListViewState extends State<HomePageListView> {
  getImageFileName(stickerPack, id, index){
    return "lib/projects/json_image_list_and_grid_view/sticker_packs/"+ (index + 1).toString() +"/" + stickerPack["stickers"][id]["image_file"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Show"),
      ),
      body: Container(
          padding: EdgeInsets.all(13),
          child: ListView.builder(
              itemCount: widget.stickerPacks.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    print("open -> " + widget.stickerPacks[index]["name"]);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StickerPackGridView(widget.stickerPacks[index])));
                  },
                  child: Card(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20.0),
                          top: Radius.circular(2.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(widget.stickerPacks[index]["name"],
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.8)),
                              Row(
                                children: [
                                  Image.asset(
                                    getImageFileName(widget.stickerPacks[index], 0, index),
                                    height: 80,
                                    width: 80,
                                  ),
                                  Image.asset(
                                    getImageFileName(widget.stickerPacks[index], 1, index),
                                    height: 80,
                                    width: 80,
                                  ),
                                  Image.asset(
                                    getImageFileName(widget.stickerPacks[index], 2, index),
                                    height: 80,
                                    width: 80,
                                  ),
                                  Opacity(
                                    opacity: 0.0,
                                    child: Image.asset(
                                      getImageFileName(widget.stickerPacks[index], 2, index),
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  if(index % 2 == 0)IconButton(icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 30,
                                  ))
                                  else(
                                      IconButton(icon: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 30,
                                  )))
                                ],
                              ),
                              Text(
                                "click + add stickers to WhatsApp",
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          )
      ),
    );
  }
}

class StickerPackGridView extends StatefulWidget {
  Map<String, dynamic> stickerPack;
  StickerPackGridView(stickerPack){
    this.stickerPack = stickerPack;
  }
  @override
  _StickerPackGridViewState createState() => _StickerPackGridViewState();
}

class _StickerPackGridViewState extends State<StickerPackGridView> {
  getImageFileName(stickerPack, id){
    return "lib/projects/json_image_list_and_grid_view/sticker_packs/"+ stickerPack["identifier"] +"/" + stickerPack["stickers"][id]["image_file"];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.stickerPack["name"]),
      ),
      body: Container(
        padding: EdgeInsets.all(13),
        child: GridView.builder(
          itemCount: widget.stickerPack["stickers"].length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext context, int index){
              return Image.asset(getImageFileName(widget.stickerPack, index));
            }),
      ),
    );
  }
}

