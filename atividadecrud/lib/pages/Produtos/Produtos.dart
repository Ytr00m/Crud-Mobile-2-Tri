import 'package:atividadecrud/main.dart';
import 'package:flutter/material.dart';
import '../../models.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});
  @override
  String toStringShort() {
    return "Produtos";
  }

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Produtos"),
          titleTextStyle: DefaultTextStyle.of(context)
              .style
              .copyWith(color: Colors.white, fontSize: 20),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
          itemBuilder: listTile,
          itemCount: produtos.length,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.pushNamed(context, "formProdutos");
            setState(() {});
          },
        ));
  }

  Widget listTile(BuildContext context, index) {
    Produto p = produtos[index];

    return ListTile(
      leading: Icon(
        Icons.shopping_bag, // Ícone de sacola de compras
        color: p.estoque > 0 ? Colors.black : Colors.red,
      ),
      title: Text(p.nome),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("R\$ ${p.preco.toString()}"),
          Text("Em estoque: ${p.estoque}")
        ],
      ),
      trailing: const Icon(Icons.arrow_forward), // Ícone de seta para a direita
      onTap: () async {
        await Navigator.pushNamed(context, "formProdutos", arguments: index);
        setState(() {});
      },
    );
  }
}
