import 'package:atividadecrud/main.dart';
import 'package:flutter/material.dart';
import 'package:atividadecrud/models.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});
  @override
  String toStringShort() {
    return "Clientes";
  }

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Clientes"), titleTextStyle: DefaultTextStyle.of(context).style.copyWith(color: Colors.white, fontSize: 20) ,centerTitle: true, backgroundColor: Theme.of(context).primaryColor,),
      body: ListView.builder(
        itemBuilder: listTile,
        itemCount: clientes.length,
        ),
      );
  }


  Widget listTile(BuildContext context, index) {
    Cliente c = clientes[index];

    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(c.nome),
      subtitle: Text(c.email),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () async {
        await Navigator.pushNamed(context, "formClientes", arguments: index);
        setState(() { });
      } ,

    );

  }
}

