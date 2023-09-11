import 'package:atividadecrud/main.dart';
import 'package:atividadecrud/models.dart';
import 'package:flutter/material.dart';

class FormPagamentosPage extends StatefulWidget {
  const FormPagamentosPage({Key? key});

  @override
  State<FormPagamentosPage> createState() => _FormPagamentosPageState();
}

class _FormPagamentosPageState extends State<FormPagamentosPage> {
  final TextEditingController _tipo = TextEditingController();
  final TextEditingController _valor = TextEditingController();
  final TextEditingController _data = TextEditingController();

  bool apagado = false;
  @override
  Widget build(BuildContext context) {
    int index = -1;

    if (ModalRoute.of(context)!.settings.arguments != null && !apagado) {
      index = ModalRoute.of(context)!.settings.arguments as int;

      _tipo.text = pagamentos.elementAt(index).tipo;
      _valor.text = pagamentos.elementAt(index).valor.toString();
      _data.text = pagamentos.elementAt(index).data;
    }

    salvar() {
      setState(() {
        if (index > -1) {
          pagamentos[index].tipo = _tipo.text;
          pagamentos[index].valor = double.parse(_valor.text);
          pagamentos[index].data = _data.text;
        } else {
          pagamentos.add(Pagamento(
            _tipo.text,
            double.parse(_valor.text),
            _data.text,
          ));
        }
        Navigator.pop(context, true);
      });
    }

    excluir() {
      setState(() {
        pagamentos.removeAt(index);
        apagado = true;
        Navigator.pop(context, true);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Pagamentos"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          ...[
            TextField(
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: "Tipo de Pagamento",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: _tipo,
            ),
            TextField(
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: "Valor",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: _valor,
            ),
            TextField(
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: "Data",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: _data,
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
