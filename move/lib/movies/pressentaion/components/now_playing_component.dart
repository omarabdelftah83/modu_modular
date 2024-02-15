import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:move/movies/pressentaion/screen/movie_datails_screen.dart';

import '../../../core/utiles/app_constance.dart';
import '../../../core/utiles/app_string.dart';
import '../controller/movies_block.dart';
import '../controller/movies_state.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBlock, MoviesState>(
        buildWhen: (previous, current) =>
            previous.nowPlayingState != current.nowPlayingState,
        builder: (context, M) {
          return FadeIn(
            duration: const Duration(milliseconds: 100),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {},
              ),
              items: M.nowPlayingMovies.map(
                (item) {
                  return GestureDetector(
                    onTap: () =>
                        Modular.to.pushNamed('/move/MovieDatailsScreen',arguments: item.id),
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) =>
                    //             MovieDatailsScreen(
                    //               id: item.id,
                    //             )));

                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                // fromLTRB
                                Colors.transparent,
                                Colors.white,
                                Colors.white,
                                Colors.black,
                              ],
                              stops: [0, 0.3, 0.5, 1],
                            ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            height: 560.0,
                            imageUrl: AppConstance.imageUrl(item.backdropPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.redAccent,
                                      size: 16.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      AppString.nowPlaying.toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          );
        });
  }
}

//);
// return FadeIn(
//   duration: const Duration(milliseconds: 100),
//   child: CarouselSlider(
//     options: CarouselOptions(
//       height: 250.0,
//       viewportFraction: 1.0,
//       onPageChanged: (index, reason) {},
//     ),
//     items: moviesList.map(
//           (item) {
//
//
//         return GestureDetector(
//           key: const Key('openMovieMinimalDetail'),
//           onTap: () {
//             /// TODO : NAVIGATE TO MOVIE DETAILS
//           },
//           child: Stack(
//             children: [
//               ShaderMask(
//                 shaderCallback: (rect) {
//                   return const LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       // fromLTRB
//                       Colors.transparent,
//                       Colors.white,
//                       Colors.white,
//                       Colors.black,
//                     ],
//                     stops: [0, 0.3, 0.5, 1],
//                   ).createShader(
//                     Rect.fromLTRB(0, 0, rect.width, rect.height),
//                   );
//                 },
//                 blendMode: BlendMode.dstIn,
//                 child: CachedNetworkImage(
//                   height: 560.0,
//                   imageUrl: AppConstance.imageUrl(item.backdropPath!),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(
//                             Icons.circle,
//                             color: Colors.redAccent,
//                             size: 16.0,
//                           ),
//                           const SizedBox(width: 4.0),
//                           Text(
//                             'Now Playing'.toUpperCase(),
//                             style: const TextStyle(
//                               fontSize: 16.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 16.0),
//                       child: Text(
//                         item.title!,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           fontSize: 24,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     ).toList(),
//   ),
// );
