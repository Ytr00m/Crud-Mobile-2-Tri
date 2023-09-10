class Cliente {
  String nome;
  String email;
  String endereco;
  String dataNasc;
  String telefone;

  Cliente(this.nome, this.email, this.endereco, this.dataNasc, this.telefone);
}

class Produto {
  String nome;
  String descricao;
  double preco;
  int estoque;

  Produto(this.nome, this.descricao, this.preco, this.estoque);
}

class Categoria {
  String nome;
  String descricao;

  Categoria(this.nome, this.descricao);
}

class Pedido {
  String dataPed;
  String dataEnt;
  String dataEntR;
  String status;
  double valortotal;

  Pedido(
      this.dataPed, this.dataEnt, this.dataEntR, this.status, this.valortotal);
}

class Funcionarios {
  String nome;
  String cargo;
  String email;
  String telefone;

  Funcionarios(this.nome, this.cargo, this.email, this.telefone);
}

class Usuarios {
  String nome;
  String email;
  String senha;

  Usuarios(this.nome, this.email, this.senha);
}

class Enderecos {
  String rua;
  String numero;
  String complemento;
  String bairro;
  String cidade;
  String estado;
  String cep;

  Enderecos(this.rua, this.numero, this.complemento, this.bairro, this.cidade,
      this.estado, this.cep);
}

class Pagamentos {
  String tipo;
  double valor;
  String data;

  Pagamentos(this.tipo, this.valor, this.data);
}

class Compra {
  int idProduto;
  int quantidade;
  double precoUnitario;
  String dataCompra;

  Compra(this.idProduto, this.quantidade, this.precoUnitario, this.dataCompra);
}
