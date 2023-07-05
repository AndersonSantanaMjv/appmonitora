import 'package:appmonitora/entities/infra_entity.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../components/spacer_component.dart';

class NovaMonitoracaoWidget extends StatefulWidget {
  final void Function(InfraEntity item) callback;

  const NovaMonitoracaoWidget({
    super.key,
    required this.callback,
  });

  @override
  State<NovaMonitoracaoWidget> createState() => _NovaMonitoracaoWidgetState();
}

enum TipoListaMonitorado {
  CPU,
  Memoria,
  IO,
  Latencia,
  Oracle,
  DB2,
}

class _NovaMonitoracaoWidgetState extends State<NovaMonitoracaoWidget> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyTarefas = GlobalKey<FormState>();
  final _descricaoDoMonitoradoController = TextEditingController();

  List<TextEditingController> itens = [];
  TipoListaMonitorado dropdownValue = TipoListaMonitorado.CPU;

  Widget defaultCheckItemMonitorado(TextEditingController controller) {
    return CheckboxListTile(
      title: TextFormField(
        controller: controller,
        decoration:
            const InputDecoration(hintText: 'Digite um item a ser monitorado'),
        validator: (value) {
          return (value == null || value.isEmpty)
              ? 'Por favor, digite um item a ser monitorado !'
              : null;
        },
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.all(0),
      value: false,
      onChanged: null,
    );
  }

  void handleSubmit() {
    final isValido = _formKey.currentState!.validate();
    if (isValido) {
      final item = InfraEntity(
        uuid: const Uuid().v4(),
        descricaoDoMonitorado: dropdownValue.name,
      );

      bool valid = true;

      if (valid) {
        widget.callback(item);
        Navigator.pop(context);
      }
    }
  }

  void addItem() {
    itens.add(TextEditingController());
    setState(() {
      itens = itens;
    });
  }

  @override
  void initState() {
    super.initState();
    _descricaoDoMonitoradoController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Row(
          children: [
            const Text('Tipo de Monitoração', style: TextStyle(fontSize: 18)),
            const SpacerComponent(isFull: true),
            DropdownButton(
              value: dropdownValue,
              items: const [
                DropdownMenuItem(
                  value: TipoListaMonitorado.CPU,
                  child: Text('Monitorar CPU'),
                ),
                DropdownMenuItem(
                  value: TipoListaMonitorado.DB2,
                  child: Text('Monitorar Banco DB2'),
                ),
                DropdownMenuItem(
                  value: TipoListaMonitorado.IO,
                  child: Text('Monitorar IO'),
                ),
                DropdownMenuItem(
                  value: TipoListaMonitorado.Latencia,
                  child: Text('Monitorar Latencia'),
                ),
                DropdownMenuItem(
                  value: TipoListaMonitorado.Memoria,
                  child: Text('Monitorar Memoria'),
                ),
                DropdownMenuItem(
                  value: TipoListaMonitorado.Oracle,
                  child: Text('Monitorar Oracle'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
            ),
          ],
        ),
        const SpacerComponent(),
        Form(
          key: _formKeyTarefas,
          child:
              Column(children: itens.map(defaultCheckItemMonitorado).toList()),
        ),
        const SpacerComponent(),
        ElevatedButton(
          onPressed: handleSubmit,
          child: const Text('Monitorar'),
        ),
      ]),
    );
  }
}
