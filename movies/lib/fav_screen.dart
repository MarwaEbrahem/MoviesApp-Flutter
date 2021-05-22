
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:movies/second.dart';
import 'package:provider/provider.dart';

import 'get_movie_model.dart';


class Favourites extends StatefulWidget {
  Favourites({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _Favourites createState() => _Favourites();
}

class _Favourites extends State<Favourites> {

  @override
  void initState() {
    Provider.of<  MovieModel  >(context,listen: false).getDBMovies();
    super.initState();
  }
  @override
  Widget build(BuildContext cont) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Consumer<MovieModel>(builder: (context,model,__) {
      return ListView.builder(
          itemCount: model.dbMovies.length ,
          itemBuilder: (context, int index) {
            return GestureDetector(
                onTap: () {
                  print(model.dbMovies[index]);
                  // Navigator.push(
                  //   cont,
                  //   MaterialPageRoute(
                  //       builder: (cont) => Second(
                  //         model.dbMovies[index],
                  //       )),
                  // );
                },
                child: Container(
                  color: const Color(0xFF009688),
                                  child: Row(
                    
                    children: [
                      
                      Container(
                        padding: new EdgeInsets.all(10),
                        child: Hero(
                         
                         tag: model.dbMovies[index].id,
                          child: Image.network('https://image.tmdb.org/t/p/w200'+ model.dbMovies[index].posterPath,
                       
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
    
                      ),
                        ),
                      ),
                      
                      
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  model.dbMovies[index].originalTitle,
                                  style:
                                      TextStyle(color: Colors.redAccent, fontSize: 20 , fontWeight: FontWeight.bold),
                                ),
                              ),
                            
                              
                            ],
                          ),
                      ),

                    ],
                  ),
                ),);
          });
    }
      );

  }
}