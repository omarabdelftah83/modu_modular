import 'package:auth/auth_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:move/move_module.dart';
class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: AuthModule());
    r.module('/move', module: MoveModule());

  }
}