import 'package:dio/dio.dart';

import 'movies_model.dart';

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