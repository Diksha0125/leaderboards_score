import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_board_score/ui/games.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Widget get playingGame => Padding(
        padding: EdgeInsets.only(top: 20),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: 160,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.deepPurple[800],
                    Colors.deepPurple[400],
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'LEVEL 20',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 15, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircularPercentIndicator(
                          radius: 55.0,
                          lineWidth: 6.0,
                          animation: true,
                          percent: 0.2,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.black87,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Transform(
                            transform: Matrix4.skewX(-0.05),
                            origin: Offset(50.0, 50.0),
                            child: Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 10, bottom: 10),
                                child: Text(
                                  'PLAY',
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
                ],
              ),
            ),
            Positioned(
              right: 10,
              bottom: 80,
              child: Container(
                  height: 100,
                  width: 180,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/mario.jpeg'),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(100),
                            blurRadius: 10.0),
                      ])),
            ),
          ],
        ),
      );

  Widget get leaderBoardScores => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: 30,
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/chimp.jpg'),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 30,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/David.jpg'),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 30,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/Eli.jpeg'),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 30,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/merfus.jpeg'),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 30,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/chimp.jpg'),
              ),
            ],
          ),
        ],
      );

  Widget get body => Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                'Continue Playing',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            playingGame,
            SizedBox(height: 20),
            Divider(color: Colors.black.withOpacity(0.7)),
            SizedBox(height: 20),
            Text(
              'Leaderboard',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10),
            leaderBoardScores
          ],
        ),
      );

  Widget get appBar => AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, color: Colors.white),
        title: Text(
          'Hi Diksha',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Games()));
              },
              child: Icon(
                Icons.category,
                color: Colors.black,
                size: 30,
              )),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(child: body),
    );
  }
}
