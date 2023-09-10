import 'package:atividadecrud/main.dart';
import 'package:atividadecrud/models.dart';
import 'package:flutter/material.dart';

class FormClientesPage extends StatefulWidget {
  const FormClientesPage({super.key});


  @override
  State<FormClientesPage> createState() => _FormClientesPageState();

}

class _FormClientesPageState extends State<FormClientesPage> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _endereco = TextEditingController();
  final TextEditingController _dataNasc = TextEditingController();
  final TextEditingController _telefone = TextEditingController();
  bool apagado = false;
  @override
  Widget build(BuildContext context) {
    int index = -1;
    
    if(ModalRoute.of(context)!.settings.arguments != null && !apagado) {
      index = ModalRoute.of(context)!.settings.arguments as int;

      _nome.text = clientes.elementAt(index).nome;
      _email.text = clientes.elementAt(index).email;
      _endereco.text = clientes.elementAt(index).endereco;
      _dataNasc.text = clientes.elementAt(index).dataNasc;
      _telefone.text = clientes.elementAt(index).telefone;
    }


    salvar() {
      setState(() {
        if(index > -1) {
          clientes[index].nome = _nome.text;
          clientes[index].email = _email.text;
          clientes[index].endereco = _endereco.text;
          clientes[index].dataNasc = _dataNasc.text;
          clientes[index].telefone = _telefone.text;
        }

        else {
          clientes.add(Cliente(_nome.text, _email.text, _endereco.text, _dataNasc.text, _telefone.text));
        }
        Navigator.pop(context, true);

      });
    }

    excluir() {
      setState(() {
        clientes.removeAt(index);
        apagado = true;
        Navigator.pop(context, true);
      });
    }



    return Scaffold(
      appBar: AppBar(title: const Text("Form Clientes"), backgroundColor: Theme.of(context).primaryColor,),
      body: Column(children: [...[
        TextField(
          decoration: const InputDecoration(
            alignLabelWithHint: true,
            labelText: "Nome",
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
            ),
          controller: _nome,),

          TextField(
          decoration: const InputDecoration(
            alignLabelWithHint: true,
            labelText: "E-mail",
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
            ),
          controller: _email,),
          TextField(
          decoration: const InputDecoration(
            alignLabelWithHint: true,
            labelText: "Endereço",
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
            ),
          controller: _endereco,),
          TextField(
          decoration: const InputDecoration(
            alignLabelWithHint: true,
            labelText: "Data de Nascimento",
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
            ),
          controller: _dataNasc,),
          TextField(
          decoration: const InputDecoration(
            alignLabelWithHint: true,
            labelText: "Telefone",
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
            ),
          controller: _telefone,),
      ].map((e) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: e,
      )
      ).toList(),
      Row(children: <Widget>[
        ElevatedButton(onPressed: salvar, child: const Text("Salvar")),
        ElevatedButton(onPressed: index > -1 ? excluir : null, style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: const Text("Excluir"))
      ])
      ])
    );
  }


}