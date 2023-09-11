import 'package:atividadecrud/main.dart';
import 'package:flutter/material.dart';
import 'package:atividadecrud/models.dart';

class Compras extends StatefulWidget {
  const Compras({Key? key});
  @override
  String toStringShort() {
    return "Compras";
  }

  @override
  State<Compras> createState() => _ComprasState();
}

class _ComprasState extends State<Compras> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compras"),
        titleTextStyle: DefaultTextStyle.of(context)
            .style
            .copyWith(color: Colors.white, fontSize: 20),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: listTile,
        itemCount: compras.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.pushNamed(context, "formCompras");
        },
      ),
    );
  }

  Widget listTile(BuildContext context, int index) {
    Compra c = compras[index];

    return ListTile(
      leading: const Icon(Icons.wallet),
      title: Text("Produto ${c.idProduto}"),
      subtitle: Text(c.quantidade.toString()), // Converter para String aqui
      trailing: const Icon(Icons.arrow_forward),
      onTap: () async {
        await Navigator.pushNamed(context, "formCompras", arguments: index);
        setState(() {});
      },
    );
  }
}
