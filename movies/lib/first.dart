import 'package:flutter/material.dart';
import 'package:movies/now_playing.dart';
import 'package:movies/popular.dart';
import 'package:movies/top_rated.dart';
import 'package:movies/upcoming_movies.dart';




class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Text("NowPlaying",style:
                                    TextStyle( fontSize: 12))),
                Tab(icon: Text("UpComing")),
                Tab(icon: Text("TopRate")),
                Tab(icon: Text("Popular")),

        ],
        ),
        title: Text("Movies"),
        leading: Icon(Icons.arrow_back),
        actions: [Center(
                  child: Container(
             child: Text("Favourit"),
             padding: new EdgeInsets.fromLTRB(0, 0, 0, 10),
          ),
        ), ],
        backgroundColor: Colors.teal,
        ),
        body: TabBarView(children: [
          NowPlaying(),
          Upcoming(),
          TopRated(),
          Popular(),
        ],),
        ),
      )
    );
    
  }
}
