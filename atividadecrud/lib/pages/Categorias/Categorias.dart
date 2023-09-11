import 'package:atividadecrud/main.dart';
import 'package:atividadecrud/models.dart';
import 'package:flutter/material.dart';

class Categorias extends StatefulWidget {
  const Categorias({super.key});
  @override
  String toStringShort() {
    return "Categorias";
  }

  @override
  State<Categorias> createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Categorias"),
          titleTextStyle: DefaultTextStyle.of(context)
              .style
              .copyWith(color: Colors.white, fontSize: 20),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
          itemBuilder: listTile,
          itemCount: categorias.length,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.pushNamed(context, "formCategorias");
            setState(() {});
          },
        ));
  }

  Widget listTile(BuildContext context, index) {
    Categoria ca = categorias[index];

    return ListTile(
      leading: const Icon(Icons.category), // Ícone de categoria
      title: Text(ca.nome),
      subtitle: Text(ca.descricao),
      trailing: const Icon(Icons.arrow_forward), // Ícone de seta para a direita
      onTap: () async {
        await Navigator.pushNamed(context, "formCategorias", arguments: index);
        setState(() {});
      },
    );
  }
}
