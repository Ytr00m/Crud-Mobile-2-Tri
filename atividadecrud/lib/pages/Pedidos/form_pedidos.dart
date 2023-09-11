import 'package:atividadecrud/main.dart';
import 'package:atividadecrud/models.dart';
import 'package:flutter/material.dart';

class FormPedidosPage extends StatefulWidget {
  const FormPedidosPage({Key? key});

  @override
  State<FormPedidosPage> createState() => _FormPedidosPageState();
}

class _FormPedidosPageState extends State<FormPedidosPage> {
  final TextEditingController _dataPed = TextEditingController();
  final TextEditingController _dataEnt = TextEditingController();
  final TextEditingController _dataEntR = TextEditingController();
  final TextEditingController _status = TextEditingController();
  final TextEditingController _valortotal = TextEditingController();

  bool apagado = false;
  @override
  Widget build(BuildContext context) {
    int index = -1;

    if (ModalRoute.of(context)!.settings.arguments != null && !apagado) {
      index = ModalRoute.of(context)!.settings.arguments as int;

      _dataPed.text = pedidos.elementAt(index).dataPed;
      _dataEnt.text = pedidos.elementAt(index).dataEnt;
      _dataEntR.text = pedidos.elementAt(index).dataEntR;
      _status.text = pedidos.elementAt(index).status;
      _valortotal.text = pedidos.elementAt(index).valortotal.toString();
    }

    salvar() {
      setState(() {
        if (index > -1) {
          pedidos[index].dataPed = _dataPed.text;
          pedidos[index].dataEnt = _dataEnt.text;
          pedidos[index].dataEntR = _dataEntR.text;
          pedidos[index].status = _status.text;
          pedidos[index].valortotal = double.parse(_valortotal.text);
        } else {
          pedidos.add(Pedido(
            _dataPed.text,
            _dataEnt.text,
            _dataEntR.text,
            _status.text,
            double.parse(_valortotal.text),
          ));
        }
        Navigator.pop(context, true);
      });
    }

    excluir() {
      setState(() {
        pedidos.removeAt(index);
        apagado = true;
        Navigator.pop(context, true);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Pedidos"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          ...[
            TextField(
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: "Data do Pedido",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: _dataPed,
            ),
            TextField(
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: "Data de Entrega Prevista",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: _dataEnt,
            ),
            TextField(
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: "Data de Entrega Real",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: _dataEntR,
            ),
            TextField(
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: "Status do Pedido",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: _status,
            ),
            TextField(
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: "Valor Total",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: _valortotal,
            ),
          ]
              .map(
                (e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: e,
                ),
              )
              .toList(),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: salvar,
                child: const Text("Salvar"),
              ),
              ElevatedButton(
                onPressed: index > -1 ? excluir : null,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Excluir"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
