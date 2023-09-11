import 'package:atividadecrud/main.dart';
import 'package:atividadecrud/models.dart';
import 'package:flutter/material.dart';

class FormFuncionariosPage extends StatefulWidget {
  const FormFuncionariosPage({super.key});

  @override
  State<FormFuncionariosPage> createState() => _FormFuncionariosPageState();
}

class _FormFuncionariosPageState extends State<FormFuncionariosPage> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _cargo = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _telefone = TextEditingController();

  bool apagado = false;
  @override
  Widget build(BuildContext context) {
    int index = -1;

    if (ModalRoute.of(context)!.settings.arguments != null && !apagado) {
      index = ModalRoute.of(context)!.settings.arguments as int;

      _nome.text = funcionarios.elementAt(index).nome;
      _cargo.text = funcionarios.elementAt(index).cargo;
      _email.text = funcionarios.elementAt(index).email;
      _telefone.text = funcionarios.elementAt(index).telefone;
    }

    salvar() {
      setState(() {
        if (index > -1) {
          funcionarios[index].nome = _nome.text;
          funcionarios[index].cargo = _cargo.text;
          funcionarios[index].email = _email.text;
          funcionarios[index].telefone = _telefone.text;
        } else {
          funcionarios.add(Funcionario(
              _nome.text, _cargo.text, _email.text, _telefone.text));
        }
        Navigator.pop(context, true);
      });
    }

    excluir() {
      setState(() {
        funcionarios.removeAt(index);
        apagado = true;
        Navigator.pop(context, true);
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Form Funcionários"),
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
                  labelText: "Cargo",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _cargo,
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
