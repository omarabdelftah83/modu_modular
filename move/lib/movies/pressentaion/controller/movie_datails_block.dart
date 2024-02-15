import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utiles/enum.dart';
import '../../domain/usercases/get_movie_datiles.dart';
import 'movie_datailes_event.dart';
import 'movie_datailes_state.dart';

class MovieDataliesBloc extends Bloc<MovieDatailesEvent,MovieDatalsStste>{
     GetMovieDataliesUseCase getMovieDataliesUseCase;

     MovieDataliesBloc(this.getMovieDataliesUseCase):super(MovieDatalsStste()){

          on<GetmovieDatailesEvent>((event,Emitter<MovieDatalsStste> emit) async{
               final re=  await getMovieDataliesUseCase.exuteDatalies(event.id);

               re.fold((l) => emit(

                   state.CopyWith2(
                       requastStat: RequastStat.error,
                        datailsmassage: 'error',
                   )),
                       (r) => emit(state.CopyWith2(
                      movieDatails:r ,
                       requastStat: RequastStat.loaded
                   )));
          });
     }

}