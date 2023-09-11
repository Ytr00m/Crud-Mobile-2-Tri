import 'package:atividadecrud/main.dart';
import 'package:flutter/material.dart';
import 'package:atividadecrud/models.dart';

class Usuarios extends StatefulWidget {
  const Usuarios({super.key});
  @override
  String toStringShort() {
    return "Usuarios";
  }

  @override
  State<Usuarios> createState() => UsuariosState();
}

class UsuariosState extends State<Usuarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Usuarios"),
          titleTextStyle: DefaultTextStyle.of(context)
              .style
              .copyWith(color: Colors.white, fontSize: 20),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
          itemBuilder: listTile,
          itemCount: usuarios.length,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.pushNamed(context, "formUsuarios");
            setState(() {});
          },
        ));
  }

  Widget listTile(BuildContext context, index) {
    Usuario u = usuarios[index];

    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(u.nome),
      subtitle: Text(u.email),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () async {
        await Navigator.pushNamed(context, "formUsuarios", arguments: index);
        setState(() {});
      },
    );
  }
}
