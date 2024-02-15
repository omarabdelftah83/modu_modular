
import 'package:dartz/dartz.dart';

import '../../../core/error/faliuare.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class TopratedMoviesUsercase{
  BaseMoviesRepository baseMoviesRepository;
  TopratedMoviesUsercase(this.baseMoviesRepository);
  Future<Either< Faluiare,List<Movie>>> excute()async{
    return await baseMoviesRepository.getTopRatedMovies();
  }
}