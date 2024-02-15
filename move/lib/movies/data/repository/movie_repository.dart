import 'package:dartz/dartz.dart';
import '../../../core/error/exception.dart';
import '../../../core/error/faliuare.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_datails.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../datasourse/movie_remote_datasourse.dart';

//ليه ورث من base الساسي
  class MovieRepository implements BaseMoviesRepository{
  final BaseMovieRemoteDatasourse baseMovieRemoteDatasourse;
  MovieRepository(this.baseMovieRemoteDatasourse);

  @override
  Future<Either< Faluiare,List<Movie>>> getNowPlaying()async {
    final result= await  baseMovieRemoteDatasourse.getNowPlayingMovieDatasourse();
    try{
      return right(result);
       }
    on ServerExcepion catch (faluaire){
      left(ServerFaluiare(faluaire.errorMasage.stutesMassage));

      throw UnimplementedError();
    }

  }

  @override
  Future<Either<Faluiare, List<Movie>>> getPopularMovies()async {
    final result = await baseMovieRemoteDatasourse.getpopularMovieDatasourse();
    try {
      return right(result);
    }
    on ServerExcepion catch (faluaire) {
      left(ServerFaluiare(faluaire.errorMasage.stutesMassage));
      throw UnimplementedError();
    }}

    @override
    Future<Either<Faluiare, List<Movie>>> getTopRatedMovies() async{
      final result=await  baseMovieRemoteDatasourse.getTopRatedMovieDatasourse();
      try{return right(result);}
      on ServerExcepion catch (faluaire){
        left(ServerFaluiare(faluaire.errorMasage.stutesMassage));
        throw UnimplementedError();

      }
  }

  @override
  Future<Either<Faluiare, MovieDatails>> getMovieDatalies(int id) async{
    final result=await  baseMovieRemoteDatasourse.getDaliesMovieDatasourse( id);
    try{return right(result);}
    on ServerExcepion catch (faluaire){
      left(ServerFaluiare(faluaire.errorMasage.stutesMassage));
    throw UnimplementedError();
  }}}


