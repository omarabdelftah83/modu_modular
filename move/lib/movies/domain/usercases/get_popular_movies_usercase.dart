import 'package:dartz/dartz.dart';

import '../../../core/error/faliuare.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetpopularMoviesUsercase{
final  BaseMoviesRepository baseMoviesRepository;
  GetpopularMoviesUsercase(this.baseMoviesRepository);

Future<Either< Faluiare,List<Movie>>> exeute()async  {
    return await baseMoviesRepository.getPopularMovies();
}

}