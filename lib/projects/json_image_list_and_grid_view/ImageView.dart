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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loadJsonData("lib/projects/json_image_list_and_grid_view/sticker_packs/sticker_packs.json");
    return SingleImageShow(stickerPacks);
  }
}

class SingleImageShow extends StatefulWidget {
  List<Map<String, dynamic>> stickerPacks;
  SingleImageShow(List<Map<String, dynamic>> stickerPakcs){
    this.stickerPacks = stickerPakcs;
  }

  @override
  _SingleImageShowState createState() => _SingleImageShowState();
}

class _SingleImageShowState extends State<SingleImageShow> {
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
                return Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20.0),
                        top: Radius.circular(2.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
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
                            Image.asset(
                              getImageFileName(widget.stickerPacks[index], 3, index),
                              height: 80,
                              width: 80,
                            )
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
                  ),
                );
              }
          )
      ),
    );
  }
}
