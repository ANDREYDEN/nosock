import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nosok/auth_guard.dart';
import 'package:nosok/collection.dart';
import 'package:nosok/settings.dart';
import 'package:nosok/sign_in.dart';
import 'package:nosok/theme.dart';

import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(NosockApp());
}

const privateRoutes = {
  Home.route: Home(),
  Collection.route: Collection(),
  Settings.route: Settings(),
};

const publicRoutes = {
  SignIn.route: SignIn(),
};

class NosockApp extends StatelessWidget {
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
      title: 'Nosock',
      theme: mainTheme,
      initialRoute: Home.route,
      onGenerateRoute: this.onGenerateRoute,
    );
  }
}
