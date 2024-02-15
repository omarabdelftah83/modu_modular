import 'package:dartz/dartz.dart';

import '../../../core/error/faliuare.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetNowPlayingMoviesUsercase{
 final BaseMoviesRepository baseMoviesRepository;
 GetNowPlayingMoviesUsercase(this.baseMoviesRepository);
 Future<Either< Faluiare,List<Movie>>> exeute()async{
   return await baseMoviesRepository.getNowPlaying();

 }

}