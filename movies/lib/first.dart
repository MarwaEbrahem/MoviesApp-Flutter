import 'package:flutter/material.dart';
import 'package:movies/now_playing.dart';
import 'package:movies/popular.dart';
import 'package:movies/top_rated.dart';
import 'package:movies/upcoming_movies.dart';

import 'fav_screen.dart';




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
        length: 5,
        child: Scaffold(
          appBar: AppBar(
              
              bottom: TabBar(
                tabs: [
                  Tab(icon: Text("NowPlaying",style:
                          TextStyle( fontSize: 11))),
                  Tab(icon: Text("UpComing",style: TextStyle(fontSize: 11),)),
                  Tab(icon: Text("TopRate",style: TextStyle(fontSize: 11),)),
                  Tab(icon: Text("Popular",style: TextStyle(fontSize: 11),)),
                  Tab(text: "Favourite",)

        ],
        ),
        title: Text("Movies"),
        leading: Icon(Icons.arrow_back),
       
        backgroundColor: Colors.teal,
         
        ),
        body: TabBarView(children: [
          NowPlaying(),
          Upcoming(),
          TopRated(),
          Popular(),
          Favourites(),
        ],),
        ),
      )
    );
    
  }
}
