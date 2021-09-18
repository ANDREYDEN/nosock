import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nosok/auth_guard.dart';
import 'package:nosok/sign_in.dart';

import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(NosokApp());
}

const privateRoutes = {
  Home.route: Home(),
};

const publicRoutes = {
  SignIn.route: SignIn(),
};

class NosokApp extends StatelessWidget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    const routes = {...privateRoutes, ...publicRoutes};
    final routeName = routeSettings.name;

    return MaterialPageRoute(builder: (context) {
      if (!routes.containsKey(routeName)) {
        return SignIn();
      }

      if (publicRoutes.containsKey(routeName)) {
        return routes[routeName]!;
      }

      return AuthGuard(child: routes[routeName]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nosok',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: Home.route,
      onGenerateRoute: this.onGenerateRoute,
    );
  }
}
