import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_board_score/json.dart';

class HighScores extends StatefulWidget {
  final String title;
  HighScores({this.title});
  @override
  _HighScoresState createState() => _HighScoresState();
}

class _HighScoresState extends State<HighScores> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = highScores;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('${post["image"]}'),
            ),
            title: Text(
              'No. ${post["title"]}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text(post["name"],
                style: TextStyle(fontWeight: FontWeight.bold)),
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
          '${widget.title} High Scores',
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
