import 'package:flutter/material.dart';

import 'app_routes.dart';

class MonitoraApp extends StatefulWidget {
  const MonitoraApp({super.key});

  @override
  State<MonitoraApp> createState() => _MonitoraAppState();
}

class _MonitoraAppState extends State<MonitoraApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitorar serviços',
      routes: AppRoutes.routes(),
    );
  }
}
