import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utiles/app_constance.dart';
import '../components/now_playing_component.dart';
import '../components/popular_component.dart';
import '../components/red_top_component.dart';
import '../controller/movies_block.dart';
import '../controller/movies_event.dart';
import '../widgit/Custom_searcha_ppbar_content.dart';
import '../widgit/custom_position _color_pink.dart';
import '../widgit/custom_position_color_green.dart';


class MainMoviesScreen extends StatelessWidget {
    MainMoviesScreen({Key? key}) : super(key: key);
    final bloc = Modular.get<MoviesBlock>()
      ..add(GetNowplayingMoviesEvent())
      ..add(GetPopluerMoviesEvent())
      ..add(GetTopRatedMoviesEvent());

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => bloc,
      child: Scaffold(
        backgroundColor: AppConstance.black,
        body: Stack(
          children: <Widget>[
            Container(
              height: screenHight,
              width: screenWidth,
              child: Stack(children: [
                const CustomPositionToColorpink(),
                //position2//
             const CustomPositionColorGreen(),

               SingleChildScrollView(
                  key: const Key('movieScrollView'),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       const SizedBox(height: 30,),
                       CustomSearchAppbarContent(),
                       const SizedBox(height: 5,),
                        const NowPlayingComponent(),
                        Container(
                          margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Popular",
                                style: GoogleFonts.poppins(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.15,
                                  color: Colors.white
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  /// TODO : NAVIGATION TO POPULAR SCREEN
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(''),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const PopularComponent(),
                        Container(
                          margin: const EdgeInsets.fromLTRB(
                            16.0,
                            24.0,
                            16.0,
                            8.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Top Rated",
                                style: GoogleFonts.poppins(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.15,
                                    color: Colors.white
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  /// TODO : NAVIGATION TO Top Rated Movies Screen
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(''),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const TopRatedComponent(),
                        const SizedBox(height: 50.0),
                      ],
                    ),
                  ),
                ),
              ],),

            )

          ],

        ),
      ),
    );
  }
}
