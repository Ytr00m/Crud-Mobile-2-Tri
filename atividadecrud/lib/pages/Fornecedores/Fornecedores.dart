import 'package:atividadecrud/main.dart';
import 'package:flutter/material.dart';
import 'package:atividadecrud/models.dart';

class Fornecedores extends StatefulWidget {
  const Fornecedores({super.key});
  @override
  String toStringShort() {
    return "Fornecedores";
  }

  @override
  State<Fornecedores> createState() => _FornecedoresState();
}

class _FornecedoresState extends State<Fornecedores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fornecedores"),
          titleTextStyle: DefaultTextStyle.of(context)
              .style
              .copyWith(color: Colors.white, fontSize: 20),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
          itemBuilder: listTile,
          itemCount: fornecedores.length,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.pushNamed(context, "formFornecedores");
            setState(() {});
          },
        ));
  }

  Widget listTile(BuildContext context, index) {
    Fornecedor f = fornecedores[index];

    return ListTile(
      leading: const Icon(Icons.store), // Ícone de loja
      title: Text(f.nome),
      subtitle: Text(f.email),
      trailing: const Icon(Icons.arrow_forward), // Ícone de seta para a direita
      onTap: () async {
        await Navigator.pushNamed(context, "formFornecedores",
            arguments: index);
        setState(() {});
      },
    );
  }
}
