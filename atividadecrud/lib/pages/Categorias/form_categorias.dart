import 'package:atividadecrud/main.dart';
import 'package:atividadecrud/models.dart';
import 'package:flutter/material.dart';

class FormCategoriasPage extends StatefulWidget {
  const FormCategoriasPage({super.key});

  @override
  State<FormCategoriasPage> createState() => _FormCategoriasPageState();
}

class _FormCategoriasPageState extends State<FormCategoriasPage> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _descricao = TextEditingController();
  bool apagado = false;
  @override
  Widget build(BuildContext context) {
    int index = -1;

    if (ModalRoute.of(context)!.settings.arguments != null && !apagado) {
      index = ModalRoute.of(context)!.settings.arguments as int;

      _nome.text = categorias.elementAt(index).nome;
      _descricao.text = categorias.elementAt(index).descricao;
    }

    salvar() {
      setState(() {
        if (index > -1) {
          categorias[index].nome = _nome.text;
          categorias[index].descricao = _descricao.text;
        } else {
          categorias.add(Categoria(_nome.text, _descricao.text));
        }
        Navigator.pop(context, true);
      });
    }

    excluir() {
      setState(() {
        categorias.removeAt(index);
        apagado = true;
        Navigator.pop(context, true);
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Form Categorias"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Column(children: [
          ...[
            TextField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Nome",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _nome,
            ),
            TextField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Descrição",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _descricao,
            ),
          ]
              .map((e) => Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: e,
                  ))
              .toList(),
          Row(children: <Widget>[
            ElevatedButton(onPressed: salvar, child: const Text("Salvar")),
            ElevatedButton(
                onPressed: index > -1 ? excluir : null,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Excluir"))
          ])
        ]));
  }
}
