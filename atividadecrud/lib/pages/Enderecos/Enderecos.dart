import 'package:atividadecrud/main.dart';
import 'package:flutter/material.dart';
import 'package:atividadecrud/models.dart';

class Enderecos extends StatefulWidget {
  const Enderecos({super.key});
  @override
  String toStringShort() {
    return "Enderecos";
  }

  @override
  State<Enderecos> createState() => _EnderecosState();
}

class _EnderecosState extends State<Enderecos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Enderecos"),
          titleTextStyle: DefaultTextStyle.of(context)
              .style
              .copyWith(color: Colors.white, fontSize: 20),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
          itemBuilder: listTile,
          itemCount: enderecos.length,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.pushNamed(context, "formEnderecos");
            setState(() {});
          },
        ));
  }

  Widget listTile(BuildContext context, index) {
    Endereco e = enderecos[index];

    return ListTile(
      leading: const Icon(Icons.location_history),
      title: Text(e.rua),
      subtitle: Text("${e.cidade} - ${e.estado}"),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () async {
        await Navigator.pushNamed(context, "formEnderecos", arguments: index);
        setState(() {});
      },
    );
  }
}
