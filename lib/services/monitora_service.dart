import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../entities/infra_entity.dart';

class MonitoraSerice {
  final _key = 'KEY_MONITORA';

  Future<void> salvar(List<InfraEntity> itens) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listJson = jsonEncode(itens);
    await prefs.setString(_key, listJson);
  }

  Future<List<InfraEntity>> buscar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? listJson = prefs.getString(_key);
    if (listJson != null) {
      return InfraEntity.fromJsonList(jsonDecode(listJson));
    }
    return [];
  }
}
