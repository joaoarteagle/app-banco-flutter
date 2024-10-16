class Transacao {
  final String id;
  final String nome;
  final double valor;

  Transacao({required this.id, required this.nome, required this.valor});

  // map para converter em json

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'valor': valor,
    };
  }

  //função para converter json para Registro

  factory Transacao.fromJson(Map<String, dynamic> json) {
    return Transacao(
      id: json['id'],
      nome: json['nome'],
      valor: json['valor'].toDouble(),
    );
  }
}
