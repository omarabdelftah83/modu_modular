import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utiles/enum.dart';
import '../../domain/usercases/get _nowplaying_movies_usercase.dart';
import '../../domain/usercases/get_popular_movies_usercase.dart';
import '../../domain/usercases/get_toprated_movies_usercase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBlock extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsercase getNowPlayingMoviesUsercase;
  final GetpopularMoviesUsercase getpopularMoviesUsercase;
  final TopratedMoviesUsercase topratedMoviesUsercase;

  MoviesBlock(
      ////constructor////
      this.getNowPlayingMoviesUsercase,
      this.getpopularMoviesUsercase,
      this.topratedMoviesUsercase)
      : super(MoviesState()) {
    //////event..1
    on<GetNowplayingMoviesEvent>((event, emit) async {
      final re = await getNowPlayingMoviesUsercase.exeute();

      re.fold(
          (l) => emit(state.Copywith(
                nowPlayingState: RequastStat.error,
                masege: 'error',
              )),
          (r) => emit(state.Copywith(
              nowPlayingMovies: r, nowPlayingState: RequastStat.loaded)));
    });

    /////////event...2
    on<GetPopluerMoviesEvent>((event, emit) async {
      final re = await getpopularMoviesUsercase.exeute();

      re.fold(
          (l) => emit(state.Copywith(
                populerState: RequastStat.error,
                populermasege: 'error',
              )),
          (r) => emit(state.Copywith(
              popluerMovies: r, populerState: RequastStat.loaded)));
    });
    ///////event...3
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final re = await topratedMoviesUsercase.excute();

      re.fold(
          (l) => emit(state.Copywith(
                topRatedState: RequastStat.error,
                topRatedrmasege: 'error',
              )),
          (r) => emit(state.Copywith(
              topRatedMovies: r, topRatedState: RequastStat.loaded)));
    });
  }
}
