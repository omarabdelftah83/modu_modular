
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../components/custom_outline.dart';
import '../screen/movies_screen.dart';

class CustomOutLineElevetedButton extends StatelessWidget {
  const CustomOutLineElevetedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: CustomOutline(
      strokeWidth: 4,
      radius: 20,
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.pinkAccent,
          Colors.greenAccent,
        ],
      ),
      width: 160,
      height: 38,
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.pinkAccent.withOpacity(0.3),
                Colors.greenAccent.withOpacity(0.3),
              ]),
        ),
        //Navigator//
         child: InkWell(
          onTap: () => Modular.to.pushNamed('/move/MainMoviesScreen'),
          child: const Center(
              child: Text(
                'skip',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),
        ),
        width: 160,
        height: 38,
      ),
    ),);
  }
}
