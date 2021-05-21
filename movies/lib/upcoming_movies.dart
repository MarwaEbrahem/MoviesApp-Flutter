import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/second.dart';

import 'call_api_function.dart';


class Upcoming extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.teal,
      body: FutureBuilder(
        future: getMoviesFromAPI("upcoming"),
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
                      child: Hero(
                       
                       tag: movieResult.id,
                        child: Image.network('https://image.tmdb.org/t/p/w200'+ movieResult.backdropPath,
                     
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
