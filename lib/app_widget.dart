import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
class AppWidget extends StatelessWidget with WidgetsBindingObserver{
  Widget build(BuildContext context){
    return MaterialApp.router(
     // title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: Modular.routerConfig,
      //routerDelegate: Modular.routerDelegate,
      //routeInformationParser: Modular.routeInformationParser,

    ); //added by extension
  }
}

