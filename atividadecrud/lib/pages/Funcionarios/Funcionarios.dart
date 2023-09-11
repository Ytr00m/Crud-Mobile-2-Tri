import 'package:atividadecrud/main.dart';
import 'package:flutter/material.dart';
import 'package:atividadecrud/models.dart';

class Funcionarios extends StatefulWidget {
  const Funcionarios({super.key});
  @override
  String toStringShort() {
    return "Funcionarios";
  }

  @override
  State<Funcionarios> createState() => _FuncionariosState();
}

class _FuncionariosState extends State<Funcionarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Funcionarios"),
          titleTextStyle: DefaultTextStyle.of(context)
              .style
              .copyWith(color: Colors.white, fontSize: 20),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
          itemBuilder: listTile,
          itemCount: funcionarios.length,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.pushNamed(context, "formFuncionarios");
            setState(() {});
          },
        ));
  }

  Widget listTile(BuildContext context, index) {
    Funcionario f = funcionarios[index];

    return ListTile(
      leading: const Icon(Icons.person), // Ícone de pessoa
      title: Text(f.nome),
      subtitle: Text(f.cargo),
      trailing: const Icon(Icons.arrow_forward), // Ícone de seta para a direita
      onTap: () async {
        await Navigator.pushNamed(context, "formFuncionarios",
            arguments: index);
        setState(() {});
      },
    );
  }
}
