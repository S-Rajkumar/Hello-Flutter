import 'dart:convert';

import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  List<Map<String,dynamic>> stickerPacks = [];
  Future<void> loadJsonData(jsonFilePath) async {
    String data = await DefaultAssetBundle.of(context).loadString(jsonFilePath);
    final _jsonData = json.decode(data);
    for(int index=0; index < _jsonData["sticker_packs"].length; index++){
      stickerPacks.add(_jsonData["sticker_packs"][index]);
    }
  }

  @override
  void initState() {
    loadJsonData("lib/projects/json_image_list_and_grid_view/sticker_packs/sticker_packs.json");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image View"),
      ),
      body: Container(
        padding: EdgeInsets.all(13.0),
        child: ListView(
          children: [
            ElevatedButton(
              child: Text("single image show"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SingleImageShow(stickerPacks)));
              },
            )
          ],
        ),
      ),
    );
  }
}

class SingleImageShow extends StatefulWidget {
  List<Map<String, dynamic>> _stickerPacks;
  SingleImageShow(List<Map<String, dynamic>> stickerPakcs){
    this._stickerPacks = stickerPakcs;
  }

  @override
  _SingleImageShowState createState() => _SingleImageShowState();
}

class _SingleImageShowState extends State<SingleImageShow> {
  getFileName(Map<String, dynamic> stickerPack) {
    return "lib/projects/json_image_list_and_grid_view/sticker_packs/1/" + stickerPack["stickers"][0]["image_file"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Show"),
      ),
      body: Container(
        padding: EdgeInsets.all(13),
        child: ListView(
          children: [
            Column(
                children: [
                Text(widget._stickerPacks[0]["name"]),
                Row(
                  children: [
                    Center(child: Image.asset(getFileName(widget._stickerPacks[0]), height: 80, width: 80,)),
                    Center(child: Image.asset(getFileName(widget._stickerPacks[0]), height: 80, width: 80)),
                    Center(child: Image.asset(getFileName(widget._stickerPacks[0]), height: 80, width: 80)),
                    Center(child: Image.asset(getFileName(widget._stickerPacks[0]), height: 80, width: 80)),
                  ],
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            )
          ],
        ),
      ),
    );
  }
}
