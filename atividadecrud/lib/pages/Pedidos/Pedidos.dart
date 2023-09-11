import 'package:atividadecrud/main.dart';
import 'package:flutter/material.dart';
import 'package:atividadecrud/models.dart';

class Pedidos extends StatefulWidget {
  const Pedidos({super.key});
  @override
  String toStringShort() {
    return "Pedidos";
  }

  @override
  State<Pedidos> createState() => PedidosState();
}

class PedidosState extends State<Pedidos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pedidos"),
          titleTextStyle: DefaultTextStyle.of(context)
              .style
              .copyWith(color: Colors.white, fontSize: 20),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
          itemBuilder: listTile,
          itemCount: pedidos.length,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.pushNamed(context, "formPedidos");
            setState(() {});
          },
        ));
  }

  Widget listTile(BuildContext context, index) {
    Pedido p = pedidos[index];

    return ListTile(
      leading: const Icon(
          Icons.local_shipping), // Ícone de transporte/local de envio
      title: Text("${p.dataPed} - R\$${p.valortotal.toString()}"),
      subtitle: Text(p.status),
      trailing: const Icon(Icons.arrow_forward), // Ícone de seta para a direita
      onTap: () async {
        await Navigator.pushNamed(context, "formPedidos", arguments: index);
        setState(() {});
      },
    );
  }
}
