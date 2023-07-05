import 'package:appmonitora/entities/infra_entity.dart';
import 'package:appmonitora/services/monitora_service.dart';
import 'package:flutter/material.dart';

import '../pages/home/components/nova_monitoracao_widget.dart';

class MonitoraProvider with ChangeNotifier {
  final service = MonitoraSerice();
  List<InfraEntity> _listaMonitoracao = [];

  MonitoraProvider() {
    buscarItensMonitorados();
  }

  buscarItensMonitorados() async {
    listaMonitoracao = await service.buscar();
  }

  List<InfraEntity> get listaMonitoracao => _listaMonitoracao;

  set listaMonitoracao(List<InfraEntity> val) {
    _listaMonitoracao = val;
    service.salvar(_listaMonitoracao);
    notifyListeners();
  }

  void abrirEscolhaDeMonitoracao(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(16),
          children: [
            NovaMonitoracaoWidget(callback: (item) {
              listaMonitoracao = [item, ...listaMonitoracao];
            }),
          ],
        );
      },
    );
  }
}
