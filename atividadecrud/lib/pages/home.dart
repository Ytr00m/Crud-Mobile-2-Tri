import 'package:atividadecrud/pages/Categorias.dart';
import 'package:atividadecrud/pages/Clientes.dart';
import 'package:atividadecrud/pages/Produtos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  List<Widget> telas = [const Clientes(), const Produtos(), const Categorias()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telas[currentPageIndex],
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.pushNamed(context, "form${telas[currentPageIndex].toStringShort()}");
          setState(() { });
        },
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.people), label: 'Clientes'),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Produtos'),
          NavigationDestination(icon: Icon(Icons.category), label: 'Categorias')
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