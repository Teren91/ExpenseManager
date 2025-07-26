import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misgastos/features/home/presentation/pages/home_page.dart';

// TODO: Importar páginas

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
}