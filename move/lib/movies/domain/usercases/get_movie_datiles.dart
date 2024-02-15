import 'package:dartz/dartz.dart';

import '../../../core/error/faliuare.dart';
import '../entities/movie_datails.dart';
import '../repository/base_movies_repository.dart';


class GetMovieDataliesUseCase {
  BaseMoviesRepository baseMoviesRepository;
  GetMovieDataliesUseCase(this.baseMoviesRepository);
  Future<Either<Faluiare, MovieDatails>> exuteDatalies(int id) async{
    return await baseMoviesRepository.getMovieDatalies(id);

  }


}