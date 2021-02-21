import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_board_score/json.dart';
import 'package:leader_board_score/ui/high_scores_of_games.dart';

class Games extends StatefulWidget {
  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = games;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(
        InkWell(
          onTap: () {
            print("list of high scores");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HighScores(
                          title: post["title"],
                        )));
          },
          child: Container(
            height: 150,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('${post["image"]}'),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(100), blurRadius: 10.0),
                ]),
            child: Container(
              padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    post["title"],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      print("Play now the game");
                    },
                    child: Transform(
                      transform: Matrix4.skewX(-0.05),
                      origin: Offset(50.0, 50.0),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 10, bottom: 10),
                          child: Text(
                            'PLAY NOW',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
  }

  Widget get body => ListView.builder(
      itemCount: itemsData.length,
      itemBuilder: (context, index) {
        return Container(
          child: itemsData[index],
        );
      });

  Widget get appBar => AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Games',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          Scaffold(backgroundColor: Colors.white, appBar: appBar, body: body),
    );
  }
}
