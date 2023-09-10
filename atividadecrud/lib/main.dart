import 'package:atividadecrud/pages/form_categorias.dart';
import 'package:atividadecrud/pages/form_clientes.dart';
import 'package:atividadecrud/pages/form_produtos.dart';
import 'package:atividadecrud/pages/home.dart';
import 'package:flutter/material.dart';

import 'models.dart';

void main() {
  runApp(const MyApp());
}

List<Cliente> clientes = <Cliente>[Cliente("Laerte", "1234@gmail.com", "Rua 0", "01/01/00", "2123415")];
List<Produto> produtos = [];
List<Categoria> categorias = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "home":(context) => const HomePage(),
        "formClientes":(context) => const FormClientesPage(),
        "formProdutos":(context) => const FormProdutosPage(),
        "formCategorias":(context) => const FormCategoriasPage(),
      },
      initialRoute: "home",
      
    );
  }
}

