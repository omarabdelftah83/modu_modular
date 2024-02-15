import 'package:auth/presention/sing_in.dart';
import 'package:flutter_modular/flutter_modular.dart';
class AuthModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => SignInScreen() );
   // r.child('/register', child: (context) =>const Register() );

  }
}