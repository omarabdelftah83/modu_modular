import 'package:flutter_modular/flutter_modular.dart';

import 'core/servies/servies_locator.dart';
import 'movies/data/datasourse/movie_remote_datasourse.dart';
import 'movies/data/repository/movie_repository.dart';
import 'movies/domain/repository/base_movies_repository.dart';
import 'movies/domain/usercases/get _nowplaying_movies_usercase.dart';
import 'movies/domain/usercases/get_movie_datiles.dart';
import 'movies/domain/usercases/get_popular_movies_usercase.dart';
import 'movies/domain/usercases/get_toprated_movies_usercase.dart';
import 'movies/pressentaion/controller/movie_datails_block.dart';
import 'movies/pressentaion/controller/movies_block.dart';
import 'movies/pressentaion/screen/home.dart';
import 'movies/pressentaion/screen/movie_datails_screen.dart';
import 'movies/pressentaion/screen/movies_screen.dart';

class MoveModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<BaseMovieRemoteDatasourse>(MovieRemoteDatasourse.new);
    ////BaseRepostry
    i.addLazySingleton<BaseMoviesRepository>(MovieRepository.new);
    ////UseCase
    i.addLazySingleton(GetNowPlayingMoviesUsercase.new);
    i.addLazySingleton(GetpopularMoviesUsercase.new);
    i.addLazySingleton(TopratedMoviesUsercase.new);
    i.addLazySingleton(GetMovieDataliesUseCase.new);
    /////////Ingection with the bloc
    i.addLazySingleton(() => MoviesBlock(
      i.get<GetNowPlayingMoviesUsercase>(),
      i.get<GetpopularMoviesUsercase>(),
      i.get<TopratedMoviesUsercase>(),
    ));
    i.addLazySingleton(() => MovieDataliesBloc(i.get<GetMovieDataliesUseCase>()));
  }
  @override
  void routes(r) {

    r.child('/', child: (context) => Home());
    r.child('/MainMoviesScreen', child: (context) => MainMoviesScreen());
    r.child('/MovieDatailsScreen', child: (context) => MovieDatailsScreen(id: r.args.data,));
  }
}
