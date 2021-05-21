import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/movies_model.dart';

class Second extends StatelessWidget {
  Results p;
  Second(Results param){
  p = param;
  print(p);
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.teal,
        body: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child : Hero(
                         tag: p.id,
                         child: Image.network(
                         'https://image.tmdb.org/t/p/w200'+ p.backdropPath,
                          width: 430.0,
                          height: 500.0,
                          fit: BoxFit.cover,
                    ),
                        ),
                  ),
                GestureDetector(
                   onTap: (){
                  Navigator.pop(context);
                  },
                     child: Container(
                    padding: new EdgeInsets.fromLTRB(20, 30, 10, 0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(p.title,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent) ),
            ),
            Container(
                 padding: new EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: RatingBarIndicator(
                
                              rating:p.voteAverage.toDouble()/2,
                              itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                             ),
                               itemCount: 5,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                             ),
            ),
            
            Row(
              children: [
                Container(
                    padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.greenAccent,
                      size: 20,
                    )
                ),
                Container(
                  padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text( p.releaseDate,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(p.overview,
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 17,
                      color: Colors.white, ),
            ),
            )
          ],
        ),
      // ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
