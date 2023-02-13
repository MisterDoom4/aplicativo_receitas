import 'package:flutter/material.dart';
import 'package:receitas/presentation/screens/home.dart';
import 'package:receitas/presentation/screens/login_screen.dart';
import 'package:receitas/presentation/screens/register_screen.dart';

class GenerateAllRoutes {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const Home());
      case '/register':
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case '/login':
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Rota não encontrada'),
            ),
          ),
        );
    }
  }
}
