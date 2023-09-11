import 'package:atividadecrud/main.dart';
import 'package:atividadecrud/models.dart';
import 'package:flutter/material.dart';

class FormComprasPage extends StatefulWidget {
  const FormComprasPage({Key? key});

  @override
  State<FormComprasPage> createState() => _FormComprasPageState();
}

class _FormComprasPageState extends State<FormComprasPage> {
  final TextEditingController _idProduto = TextEditingController();
  final TextEditingController _quantidade = TextEditingController();
  final TextEditingController _precoUnitario = TextEditingController();
  final TextEditingController _data = TextEditingController();
  bool apagado = false;
  @override
  Widget build(BuildContext context) {
    int index = -1;

    if (ModalRoute.of(context)!.settings.arguments != null && !apagado) {
      index = ModalRoute.of(context)!.settings.arguments as int;

      _idProduto.text = compras.elementAt(index).idProduto.toString();
      _quantidade.text = compras.elementAt(index).quantidade.toString();
      _precoUnitario.text = compras.elementAt(index).precoUnitario.toString();
      _data.text = compras.elementAt(index).data;
    }

    salvar() {
      setState(() {
        if (index > -1) {
          compras[index].idProduto = int.parse(_idProduto.text);
          compras[index].quantidade = int.parse(_quantidade.text);
          compras[index].precoUnitario = double.parse(_precoUnitario.text);
          compras[index].data = _data.text;
        } else {
          compras.add(Compra(
            int.parse(_idProduto.text),
            int.parse(_quantidade.text),
            double.parse(_precoUnitario.text),
            _data.text,
          ));
        }
        Navigator.pop(context, true);
      });
    }

    excluir() {
      setState(() {
        compras.removeAt(index);
        apagado = true;
        Navigator.pop(context, true);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Compras"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          ...[
            TextField(
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: "ID Produto",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: _idProduto,
            ),
            TextField(
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: "Quantidade",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: _quantidade,
            ),
            TextField(
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: "Preço Unitário",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: _precoUnitario,
            ),
            TextField(
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: "Data do Pedido",
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
