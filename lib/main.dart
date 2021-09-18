import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nosok/auth_guard.dart';
import 'package:nosok/collection.dart';
import 'package:nosok/settings.dart';
import 'package:nosok/sign_in.dart';

import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(NosokApp());
}

const privateRoutes = {
  Home.route: Home(),
  Collection.route: Collection(),
  Settings.route: Settings(),
};

const publicRoutes = {
  SignIn.route: SignIn(),
};

class NosokApp extends StatelessWidget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    const routes = {...privateRoutes, ...publicRoutes};
    final routeName = routeSettings.name;

    if (!routes.containsKey(routeName)) {
      return MaterialPageRoute(builder: (context) => publicRoutes['sign-in']!);
    }

    if (publicRoutes.containsKey(routeName)) {
      return MaterialPageRoute(builder: (context) => routes[routeName]!);
    }

    if (privateRoutes.containsKey(routeName)) {
      return MaterialPageRoute(
        builder: (context) => AuthGuard(child: routes[routeName]!),
      );
    }

    return null;
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
