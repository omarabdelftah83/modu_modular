// import 'package:get_it/get_it.dart';
// import '../../movies/data/datasourse/movie_remote_datasourse.dart';
// import '../../movies/data/repository/movie_repository.dart';
// import '../../movies/domain/repository/base_movies_repository.dart';
// import '../../movies/domain/usercases/get _nowplaying_movies_usercase.dart';
// import '../../movies/domain/usercases/get_movie_datiles.dart';
// import '../../movies/domain/usercases/get_popular_movies_usercase.dart';
// import '../../movies/domain/usercases/get_toprated_movies_usercase.dart';
// import '../../movies/pressentaion/controller/movie_datails_block.dart';
// import '../../movies/pressentaion/controller/movies_block.dart';
//
// GetIt serLoc = GetIt.instance;
// class ServiesLcator{
//   void init(){
//     ////REmoteDataSourse
//     serLoc.registerLazySingleton<BaseMovieRemoteDatasourse>(() => MovieRemoteDatasourse());
//
//     ////BaseRepostry
//     serLoc.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(serLoc()));
//
//     ////UseCase
//       serLoc.registerLazySingleton(() =>GetNowPlayingMoviesUsercase(serLoc()));
//       serLoc.registerLazySingleton(() =>GetpopularMoviesUsercase(serLoc()));
//       serLoc.registerLazySingleton(() =>TopratedMoviesUsercase(serLoc()));
//       serLoc.registerLazySingleton(() => GetMovieDataliesUseCase(serLoc()));
//
//     /////////Ingection with the bloc
//     serLoc.registerFactory(() => MoviesBlock(serLoc(),serLoc(),serLoc(),));
//    serLoc.registerFactory(() => MovieDataliesBloc(serLoc()));
// }}