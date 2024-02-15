import 'package:dartz/dartz.dart';

import '../../../core/error/faliuare.dart';
import '../entities/movie.dart';
import '../entities/movie_datails.dart';


abstract class BaseMoviesRepository{

  Future<Either< Faluiare,List<Movie>>> getNowPlaying();
  Future<Either< Faluiare,List<Movie>>> getPopularMovies();
  Future<Either< Faluiare,List<Movie>>> getTopRatedMovies();
  Future<Either<Faluiare,MovieDatails>>getMovieDatalies(int id);
  //Future<Either< Faluiare,List<MovieRecomandation>>> getMovieRecomandation();

}