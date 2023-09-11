import 'package:atividadecrud/pages/Categorias/form_categorias.dart';
import 'package:atividadecrud/pages/Clientes/form_clientes.dart';
import 'package:atividadecrud/pages/Compras/form_compras.dart';
import 'package:atividadecrud/pages/Enderecos/form_enderecos.dart';
import 'package:atividadecrud/pages/Fornecedores/form_fornecedores.dart';
import 'package:atividadecrud/pages/Funcionarios/form_funcionarios.dart';
import 'package:atividadecrud/pages/Pagamentos/form_pagamentos.dart';
import 'package:atividadecrud/pages/Pedidos/form_pedidos.dart';
import 'package:atividadecrud/pages/Produtos/form_produtos.dart';
import 'package:atividadecrud/pages/Usuarios/form_usuarios.dart';
import 'package:atividadecrud/pages/home.dart';
import 'package:flutter/material.dart';

import 'models.dart';

void main() {
  runApp(const MyApp());
}

List<Cliente> clientes = [
  Cliente(
    'Maria Silva',
    'maria@email.com',
    'Rua das Flores, 123',
    '15/05/1990',
    '+55 11 1234-5678',
  ),
  Cliente(
    'João Santos',
    'joao@email.com',
    'Avenida Central, 456',
    '10/12/1985',
    '+55 11 9876-5432',
  ),
  Cliente(
    'Ana Souza',
    'ana@email.com',
    'Rua do Comércio, 789',
    '20/03/1995',
    '+55 11 8765-4321',
  ),
];

List<Produto> produtos = [
  Produto(
    'Smartphone',
    'Modelo avançado com tela OLED.',
    1499.99,
    100,
  ),
  Produto(
    'Notebook',
    'Notebook de última geração com processador rápido.',
    2499.99,
    50,
  ),
  Produto(
    'TV 4K',
    'TV de alta resolução com tela de 55 polegadas.',
    999.99,
    30,
  ),
];
List<Pedido> pedidos = [
  Pedido(
    '01/08/2023',
    '10/08/2023',
    '12/08/2023',
    'Em processamento',
    299.99,
  ),
  Pedido(
    '05/08/2023',
    '15/08/2023',
    '18/08/2023',
    'Entregue',
    599.99,
  ),
  Pedido(
    '10/08/2023',
    '20/08/2023',
    '23/08/2023',
    'Pendente',
    199.99,
  ),
];

List<Categoria> categorias = [
  Categoria(
    'Eletrônicos',
    'Produtos eletrônicos de última geração.',
  ),
  Categoria(
    'Móveis',
    'Móveis modernos e elegantes para sua casa.',
  ),
  Categoria(
    'Roupas',
    'Moda atual com roupas de alta qualidade.',
  ),
];

List<Fornecedor> fornecedores = [
  Fornecedor(
    'Fornecedor A',
    'Rua da Indústria, 789',
    'fornecedorA@email.com',
    '+55 11 1111-1111',
  ),
  Fornecedor(
    'Fornecedor B',
    'Avenida das Empresas, 456',
    'fornecedorB@email.com',
    '+55 11 2222-2222',
  ),
  Fornecedor(
    'Fornecedor C',
    'Rua do Comércio, 123',
    'fornecedorC@email.com',
    '+55 11 3333-3333',
  ),
];

List<Funcionario> funcionarios = [
  Funcionario(
    'Pedro Alves',
    'Gerente de Vendas',
    'pedro@email.com',
    '+55 11 4444-4444',
  ),
  Funcionario(
    'Lucia Oliveira',
    'Atendente de Suporte',
    'lucia@email.com',
    '+55 11 5555-5555',
  ),
  Funcionario(
    'Marcos Santos',
    'Analista de Marketing',
    'marcos@email.com',
    '+55 11 6666-6666',
  ),
];

List<Usuario> usuarios = [
  Usuario(
    'Admin',
    'admin@admin.com',
    'admin123',
  ),
  Usuario(
    'Usuario1',
    'usuario1@email.com',
    'senha123',
  ),
  Usuario(
    'Usuario2',
    'usuario2@email.com',
    'senha456',
  ),
];

List<Endereco> enderecos = [
  Endereco(
    'Rua Principal, 123',
    'Apto 1',
    'Bloco A',
    'Centro',
    'São Paulo',
    'SP',
    '12345-678',
  ),
  Endereco(
    'Avenida Secundária, 456',
    'Casa 2',
    'Condomínio B',
    'Bela Vista',
    'Rio de Janeiro',
    'RJ',
    '23456-789',
  ),
  Endereco(
    'Travessa da Paz, 789',
    'Loja 3',
    'Térreo',
    'Jardins',
    'São Paulo',
    'SP',
    '34567-890',
  ),
];

List<Pagamento> pagamentos = [
  Pagamento(
    'Cartão de Crédito',
    199.99,
    '01/08/2023',
  ),
  Pagamento(
    'Boleto',
    149.99,
    '05/08/2023',
  ),
  Pagamento(
    'Transferência Bancária',
    99.99,
    '10/08/2023',
  ),
];

List<Compra> compras = [
  Compra(
    1,
    2,
    29.99,
    '01/08/2023',
  ),
  Compra(
    2,
    3,
    19.99,
    '05/08/2023',
  ),
  Compra(
    3,
    1,
    9.99,
    '10/08/2023',
  ),
];

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
        "home": (context) => const HomePage(),
        "formClientes": (context) => const FormClientesPage(),
        "formProdutos": (context) => const FormProdutosPage(),
        "formPedidos": (context) => const FormPedidosPage(),
        "formCategorias": (context) => const FormCategoriasPage(),
        "formFornecedores": (context) => const FormFornecedoresPage(),
        "formFuncionarios": (context) => const FormFuncionariosPage(),
        "formUsuarios": (context) => const FormUsuariosPage(),
        "formEnderecos": (context) => const FormEnderecosPage(),
        "formPagamentos": (context) => const FormPagamentosPage(),
        "formCompras": (context) => const FormComprasPage(),
      },
      initialRoute: "home",
    );
  }
}
