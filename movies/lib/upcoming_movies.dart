import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/second.dart';
import 'package:provider/provider.dart';
import 'get_movie_model.dart';


class Upcoming extends StatelessWidget{
 @override
 Widget build(BuildContext context) {
     Provider.of<MovieModel>(context,listen: false).getMoviesFromAPI("upcoming");
     return Consumer<MovieModel>(builder: (_,model,__) {
  
              return ListView.builder(
                
              itemCount: model.upcomingMovies.length,
              itemBuilder: (context, index) {
                var movieResult = model.upcomingMovies[index];
                return  GestureDetector(
                  
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Second(movieResult)));
                  },
                  
                child: Container(
                  color: const Color(0xFF009688),
                                  child: Row(
                    
                    children: [
                      
                      Container(
                        padding: new EdgeInsets.all(10),
                        child: Hero(
                         
                         tag: movieResult.id,
                          child: Image.network('https://image.tmdb.org/t/p/w200'+ movieResult.posterPath,
                       
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
                ),
              );
              },  
                
              );
        
     });   
}

  
}
