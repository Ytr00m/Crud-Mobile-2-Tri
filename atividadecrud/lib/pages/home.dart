import 'package:atividadecrud/pages/Categorias/Categorias.dart';
import 'package:atividadecrud/pages/Clientes/Clientes.dart';
import 'package:atividadecrud/pages/Compras/Compras.dart';
import 'package:atividadecrud/pages/Enderecos/Enderecos.dart';
import 'package:atividadecrud/pages/Fornecedores/Fornecedores.dart';
import 'package:atividadecrud/pages/Funcionarios/Funcionarios.dart';
import 'package:atividadecrud/pages/Pagamentos/Pagamentos.dart';
import 'package:atividadecrud/pages/Pedidos/Pedidos.dart';
import 'package:atividadecrud/pages/Produtos/Produtos.dart';
import 'package:atividadecrud/pages/Usuarios/Usuarios.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  List<Widget> telas = [
    Clientes(),
    Produtos(),
    Categorias(),
    Pedidos(),
    Fornecedores(),
    Funcionarios(),
    Usuarios(),
    Enderecos(),
    Pagamentos(),
    Compras(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telas[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Clientes',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Produtos',
          ),
          NavigationDestination(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment),
            label: 'Pedidos',
          ),
          NavigationDestination(
            icon: Icon(Icons.business),
            label: 'Fornecedores',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Funcionários',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Usuários',
          ),
          NavigationDestination(
            icon: Icon(Icons.location_on),
            label: 'Endereços',
          ),
          NavigationDestination(
            icon: Icon(Icons.payment),
            label: 'Pagamentos',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_basket),
            label: 'Compras',
          ),
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        animationDuration: const Duration(milliseconds: 1000),
      ),
    );
  }
}
