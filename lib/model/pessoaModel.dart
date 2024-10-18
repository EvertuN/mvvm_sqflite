class Pessoa {
  int? id;
  String nome;
  String email;

  Pessoa({this.id, required this.nome, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
    };
  }

  factory Pessoa.fromMap(Map<String, dynamic> map) {
    return Pessoa(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
    );
  }
}
