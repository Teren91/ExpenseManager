import 'package:flutter/material.dart';
import 'package:misgastos/app/di/injection_container.dart';
import 'package:misgastos/app/routes/app_router.dart';
import 'package:misgastos/app/themes/app_theme.dart';

void main() {
  setupDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Mis Gastos',
      // TODO: Configurar tema de la aplicación
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}