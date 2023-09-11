import 'package:atividadecrud/main.dart';
import 'package:atividadecrud/models.dart';
import 'package:flutter/material.dart';

class FormEnderecosPage extends StatefulWidget {
  const FormEnderecosPage({super.key});

  @override
  State<FormEnderecosPage> createState() => _FormEnderecosPageState();
}

class _FormEnderecosPageState extends State<FormEnderecosPage> {
  final TextEditingController _rua = TextEditingController();
  final TextEditingController _numero = TextEditingController();
  final TextEditingController _complemento = TextEditingController();
  final TextEditingController _bairro = TextEditingController();
  final TextEditingController _cidade = TextEditingController();
  final TextEditingController _estado = TextEditingController();
  final TextEditingController _cep = TextEditingController();

  bool apagado = false;
  @override
  Widget build(BuildContext context) {
    int index = -1;

    if (ModalRoute.of(context)!.settings.arguments != null && !apagado) {
      index = ModalRoute.of(context)!.settings.arguments as int;

      _rua.text = enderecos.elementAt(index).rua;
      _numero.text = enderecos.elementAt(index).numero;
      _complemento.text = enderecos.elementAt(index).complemento;
      _bairro.text = enderecos.elementAt(index).bairro;
      _cidade.text = enderecos.elementAt(index).cidade;
      _estado.text = enderecos.elementAt(index).estado;
      _cep.text = enderecos.elementAt(index).cep;
    }

    salvar() {
      setState(() {
        if (index > -1) {
          enderecos[index].rua = _rua.text;
          enderecos[index].numero = _numero.text;
          enderecos[index].complemento = _complemento.text;
          enderecos[index].bairro = _bairro.text;
          enderecos[index].cidade = _cidade.text;
          enderecos[index].estado = _estado.text;
          enderecos[index].cep = _cep.text;
        } else {
          enderecos.add(Endereco(_rua.text, _numero.text, _complemento.text,
              _bairro.text, _cidade.text, _estado.text, _cep.text));
        }
        Navigator.pop(context, true);
      });
    }

    excluir() {
      setState(() {
        enderecos.removeAt(index);
        apagado = true;
        Navigator.pop(context, true);
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Form Endereços"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Column(children: [
          ...[
            TextField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Rua",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _rua,
            ),
            TextField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Número",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _numero,
            ),
            TextField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Complemento",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _complemento,
            ),
            TextField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Bairro",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _bairro,
            ),
            TextField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Cidade",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _cidade,
            ),
            TextField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Estado",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _estado,
            ),
            TextField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Cep",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              controller: _cep,
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
