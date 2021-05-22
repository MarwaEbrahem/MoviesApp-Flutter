import 'package:flutter/material.dart';
import 'package:movies/movies_model.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final instance = AppDatabase._internal();
  Database database;

  factory AppDatabase() {
    return instance;
  }

  AppDatabase._internal() {}

  createDB() async {
    print("internal");
    database = await openDatabase(
      join(await getDatabasesPath(), 'movies.db'),
      onCreate: (db, version) {
        print("onCreate");
        db.execute(
            'CREATE TABLE movies(id INTEGER PRIMARY KEY,title TEXT,imageURL TEXT,vote INTEGER,popularity REAL,release TEXT,overView TEXT)');
      },
      version: 5,
    );
  }

  insertMovie(Results movie) async {
    print("insert");
    return await database.insert("movies", movie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Results>> getMovies() async {
    print("getmovieDB");
    List<Map<String,dynamic>> maps = await database.query("movies");
    return List.generate(maps.length, (index){
      return Results.fromMap(maps[index]);
    });
  }
}