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

class Funcionario {
  String nome;
  String cargo;
  String email;
  String telefone;

  Funcionario(this.nome, this.cargo, this.email, this.telefone);
}

class Fornecedor {
  String nome;
  String endereco;
  String email;
  String telefone;

  Fornecedor(this.nome, this.endereco, this.email, this.telefone);
}

class Usuario {
  String nome;
  String email;
  String senha;

  Usuario(this.nome, this.email, this.senha);
}

class Endereco {
  String rua;
  String numero;
  String complemento;
  String bairro;
  String cidade;
  String estado;
  String cep;

  Endereco(this.rua, this.numero, this.complemento, this.bairro, this.cidade,
      this.estado, this.cep);
}

class Pagamento {
  String tipo;
  double valor;
  String data;

  Pagamento(this.tipo, this.valor, this.data);
}

class Compra {
  int idProduto;
  int quantidade;
  double precoUnitario;
  String data;

  Compra(this.idProduto, this.quantidade, this.precoUnitario, this.data);
}
