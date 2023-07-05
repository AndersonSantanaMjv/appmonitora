import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'monitora_provider.dart';

class RootProvider {
  static List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider(create: (_) => MonitoraProvider()),
    ];
  }
}
