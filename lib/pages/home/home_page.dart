import 'package:appmonitora/providers/monitora_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/body_component.dart';
import 'abas/configuracao_tab.dart';
import 'abas/monitoracao_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MonitoraProvider store;
  late int abaSelecionada;

  final List<BottomNavigationBarItem> _abas = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.graphic_eq), label: 'Monitoração'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.engineering), label: 'Configuração'),
  ];

  final List<Widget> _conteudos = [
    const MonitoracaoTab(),
    const ConfiguracaoTab(),
  ];

  void handleTab(int tabIdx) {
    setState(() {
      abaSelecionada = tabIdx;
    });
  }

  @override
  void initState() {
    abaSelecionada = 0;
    store = Provider.of<MonitoraProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BodyComponent(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      bar: BottomNavigationBar(
        currentIndex: abaSelecionada,
        items: _abas,
        onTap: handleTab,
      ),
      actionButton: FloatingActionButton(
        onPressed: () {
          store.abrirEscolhaDeMonitoracao(context);
        },
        child: const Icon(Icons.add),
      ),
      child: _conteudos.elementAt(abaSelecionada),
    );
  }
}
