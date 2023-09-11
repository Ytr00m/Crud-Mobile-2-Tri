import 'package:atividadecrud/main.dart';
import 'package:atividadecrud/models.dart';
import 'package:flutter/material.dart';

class FormProdutosPage extends StatefulWidget {
  const FormProdutosPage({super.key});

  @override
  State<FormProdutosPage> createState() => _FormProdutosPageState();
}

class _FormProdutosPageState extends State<FormProdutosPage> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _descricao = TextEditingController();
  final TextEditingController _preco = TextEditingController();
  final TextEditingController _estoque = TextEditingController();
  bool apagado = false;
  @override
  Widget build(BuildContext context) {
    int index = -1;

    if (ModalRoute.of(context)!.settings.arguments != null && !apagado) {
      index = ModalRoute.of(context)!.settings.arguments as int;

      _nome.text = produtos.elementAt(index).nome;
      _descricao.text = produtos.elementAt(index).descricao;
      _preco.text = produtos.elementAt(index).preco.toString();
      _estoque.text = produtos.elementAt(index).estoque.toString();
    }

    salvar() {
      setState(() {
        if (index > -1) {
          produtos[index].nome = _nome.text;
          produtos[index].descricao = _descricao.text;
          produtos[index].preco = double.parse(_preco.text);
          produtos[index].estoque = int.parse(_estoque.text);
        } else {
          produtos.add(Produto(_nome.text, _descricao.text,
              double.parse(_preco.text), int.parse(_estoque.text)));
        }
        Navigator.pop(context, true);
      });
    }

    excluir() {
      setState(() {
        produtos.removeAt(index);
        apagado = true;
        Navigator.pop(context, true);
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Form Produtos"),
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
            TextField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Preço",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _preco,
            ),
            TextField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Estoque",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _estoque,
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
