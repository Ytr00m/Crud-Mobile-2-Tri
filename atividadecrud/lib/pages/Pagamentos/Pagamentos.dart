import 'package:atividadecrud/main.dart';
import 'package:flutter/material.dart';
import 'package:atividadecrud/models.dart';

class Pagamentos extends StatefulWidget {
  const Pagamentos({super.key});
  @override
  String toStringShort() {
    return "Pagamentos";
  }

  @override
  State<Pagamentos> createState() => PagamentosState();
}

class PagamentosState extends State<Pagamentos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pagamentos"),
          titleTextStyle: DefaultTextStyle.of(context)
              .style
              .copyWith(color: Colors.white, fontSize: 20),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
          itemBuilder: listTile,
          itemCount: pagamentos.length,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.pushNamed(context, "formPagamentos");
            setState(() {});
          },
        ));
  }

  Widget listTile(BuildContext context, index) {
    Pagamento p = pagamentos[index];

    return ListTile(
      leading: const Icon(Icons.attach_money), // Ícone de dinheiro
      title: Text("${p.tipo} - R\$${p.valor.toString()}"),
      subtitle: Text(p.data),
      trailing: const Icon(Icons.arrow_forward), // Ícone de seta para a direita
      onTap: () async {
        await Navigator.pushNamed(context, "formPagamentos", arguments: index);
        setState(() {});
      },
    );
  }
}
