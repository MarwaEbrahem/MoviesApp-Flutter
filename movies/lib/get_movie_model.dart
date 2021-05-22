import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'AppDataBase.dart';
import 'movies_model.dart';

class MovieModel extends ChangeNotifier{
  List<Results> _nowPlayingMovies = List();
  List<Results> _popularMovies = List();
  List<Results> _upcomingMovies = List();
  List<Results> _topRatedMovies = List();
  AppDatabase _database = AppDatabase();
  List<Results> _dbMovies = List();



  List<Results> get nowPlayingMovies => _nowPlayingMovies;
  List<Results> get popularMovies => _popularMovies;
  List<Results> get upcomingMovies => _upcomingMovies;
  List<Results> get topRatedMovies => _topRatedMovies;
  List<Results> get dbMovies => _dbMovies;


  getMoviesFromAPI(String t) async{
  var moviesList;
  try { 
  var response = await Dio().get('https://api.themoviedb.org/3/movie/$t', queryParameters: {
  'api_key' : 'f55fbda0cb73b855629e676e54ab6d8e',
  });
   moviesList = response.data['results'];
  } catch(e) {
    print(e);
  }
  if(t == "now_playing"){
    _nowPlayingMovies = (moviesList as List).map((e) => Results.fromJson(e)).toList();
  } else if(t == 'popular'){
    _popularMovies = (moviesList as List).map((e) => Results.fromJson(e)).toList();
  }else if(t == 'upcoming'){
    _upcomingMovies = (moviesList as List).map((e) => Results.fromJson(e)).toList();
  }else if(t == 'top_rated'){
    _topRatedMovies = (moviesList as List).map((e) => Results.fromJson(e)).toList();
  }
  notifyListeners();
 }
 ////////////
  
  addPhototoDatabase(Results movie){
    _database.insertMovie(movie);
    notifyListeners();
  }

  getDBMovies(){
    _database.getMovies().then((movies) => _dbMovies = movies);
    notifyListeners();
  }
}