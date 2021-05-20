import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:dio/dio.dart';
import 'movies_model.dart';
import 'second.dart';
Future <List<Results>> getMoviesFromAPI(String t) async{
  var moviesList;
  try { 
  var response = await Dio().get('https://api.themoviedb.org/3/movie/$t', queryParameters: {
  'api_key' : 'f55fbda0cb73b855629e676e54ab6d8e',
  });
   moviesList = response.data['results'];
  } catch(e) {
    print(e);
  }
  return (moviesList as List).map((e) => Results.fromJson(e)).toList();
 }


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF055665),
        title: Title(
          color: Colors.white, child: Text(
          "Now Playing",
        ),
        ),
        leading: Icon(Icons.arrow_back),
      ),
      
      body: FutureBuilder(
        future: getMoviesFromAPI("now_playing"),
        builder: (context,snapShot){
          if(snapShot.connectionState == ConnectionState.waiting && !snapShot.hasData){
            return Center(child: CircularProgressIndicator());
          }else if(snapShot.hasError){
            return Center(child: Text("Error"));
          }else{
          print(snapShot.data);
        
      return Column(
        
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              child: ListView.builder(
              itemCount: snapShot.data.length,
              itemBuilder: (context, index) {
                var movieResult = snapShot.data[index];
                return  GestureDetector(
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Second(movieResult)));
                  },
                child: Row(
                  children: [
                    Container(
                       padding: new EdgeInsets.all(10),
                        child: Image.network('https://image.tmdb.org/t/p/w200'+ movieResult.backdropPath,
                     
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
    
                    ),
                    ),
                    
                    
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                movieResult.title,
                                style:
                                    TextStyle(color: Colors.redAccent, fontSize: 20 , fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text(
                                movieResult.originalLanguage,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 15 ),
                              ),
                            ),
                          RatingBarIndicator(
                            rating: movieResult.voteAverage/2,
                            itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                           ),
                             itemCount: 5,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                           ),
                            
                            
                          ],
                        ),
                    ),

                  ],
                ),
              );
              },  
                
              ),
            ),
          )
        ],
      );
  }
}
    )
    );
  }
}
