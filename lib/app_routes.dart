import 'package:appmonitora/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import 'pages/monitoracao/monitora_page.dart';

class AppRoutes {
  static String initialRoute = '/';
  static String monitora = '/monitoracaoItem';

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      initialRoute: (context) => const HomePage(),
      monitora: (context) => const MonitoraPage(),
    };
  }
}
