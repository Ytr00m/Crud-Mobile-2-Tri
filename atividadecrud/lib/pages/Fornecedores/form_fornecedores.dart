import 'package:atividadecrud/main.dart';
import 'package:atividadecrud/models.dart';
import 'package:flutter/material.dart';

class FormFornecedoresPage extends StatefulWidget {
  const FormFornecedoresPage({super.key});

  @override
  State<FormFornecedoresPage> createState() => _FormFornecedoresPageState();
}

class _FormFornecedoresPageState extends State<FormFornecedoresPage> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _endereco = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _telefone = TextEditingController();

  bool apagado = false;
  @override
  Widget build(BuildContext context) {
    int index = -1;

    if (ModalRoute.of(context)!.settings.arguments != null && !apagado) {
      index = ModalRoute.of(context)!.settings.arguments as int;

      _nome.text = fornecedores.elementAt(index).nome;
      _endereco.text = fornecedores.elementAt(index).endereco;
      _email.text = fornecedores.elementAt(index).email;
      _telefone.text = fornecedores.elementAt(index).telefone;
    }

    salvar() {
      setState(() {
        if (index > -1) {
          fornecedores[index].nome = _nome.text;
          fornecedores[index].endereco = _endereco.text;
          fornecedores[index].email = _email.text;
          fornecedores[index].telefone = _telefone.text;
        } else {
          fornecedores.add(Fornecedor(
              _nome.text, _endereco.text, _email.text, _telefone.text));
        }
        Navigator.pop(context, true);
      });
    }

    excluir() {
      setState(() {
        fornecedores.removeAt(index);
        apagado = true;
        Navigator.pop(context, true);
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Form Fornecedores"),
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
                  labelText: "Endereço",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _endereco,
            ),
            TextField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "E-mail",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _email,
            ),
            TextField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Telefone",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _telefone,
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
