import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory_game/data/data.dart';
import 'package:memory_game/models/TileModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TileModel> gridViewTiles = <TileModel>[];
  List<TileModel> questionPairs = <TileModel>[];

  @override
  void initState() {
    super.initState();
    reStart();
  }

  void reStart() {
    myPairs = getPairs();
    myPairs.shuffle();

    gridViewTiles = myPairs;
    Future.delayed(
      const Duration(seconds: 5),
      () {
        setState(
          () {
            questionPairs = getQuestionPairs();
            gridViewTiles = questionPairs;
            pairSelected = false;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              points != 800
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "$points/800",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Points",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              points != 800
                  ? GridView(
                      shrinkWrap: true,
                      //physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          mainAxisSpacing: 0.0, maxCrossAxisExtent: 100.0),
                      children: List.generate(gridViewTiles.length, (index) {
                        return Tile(
                          imagePathUrl: gridViewTiles[index].imageAssetPath,
                          tileIndex: index,
                          parent: this,
                        );
                      }),
                    )
                  : Container(
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                points = 0;
                                reStart();
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Text(
                                "Replay",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Text(
                                "Rate Us",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  String imagePathUrl;
  int tileIndex;
  _HomeState parent;

  Tile({this.imagePathUrl, this.tileIndex, this.parent});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!pairSelected) {
          setState(() {
            myPairs[widget.tileIndex].isSelected = true;
          });
          if (selectedImage != "") {
            if (selectedImage == myPairs[widget.tileIndex].imageAssetPath) {
              pairSelected = true;
              points = points + 100;

              Future.delayed(const Duration(seconds: 2), () {
                widget.parent.setState(() {
                  myPairs[widget.tileIndex].imageAssetPath = '';
                  myPairs[selectedIndex].imageAssetPath = '';
                  pairSelected = false;
                  selectedImage = '';
                });
              });
            } else {
              pairSelected = true;
              Future.delayed(const Duration(seconds: 2), () {
                widget.parent.setState(() {
                  myPairs[widget.tileIndex].isSelected = false;
                  myPairs[selectedIndex].isSelected = false;
                  pairSelected = false;
                  selectedImage = "";
                });
              });
            }
          } else {
            setState(() {
              selectedImage = myPairs[widget.tileIndex].imageAssetPath;
              selectedIndex = widget.tileIndex;
            });
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: myPairs[widget.tileIndex].imageAssetPath != ""
            ? Image.asset(myPairs[widget.tileIndex].isSelected
                ? myPairs[widget.tileIndex].imageAssetPath
                : widget.imagePathUrl)
            : Container(
                color: Colors.white,
                child: Image.asset("assets/correct.png"),
              ),
      ),
    );
  }
}
