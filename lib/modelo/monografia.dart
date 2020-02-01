class Monografia {
  String nomealuno;
  String titulo;
  double nota;
  
  //Construtor
  Monografia(this.nomealuno, this.titulo, this.nota);

  Monografia.fromJson(Map<String, dynamic> json) {
    nomealuno = json['nomealuno'];
    titulo = json['titulo'];
    nota = json['nota'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomealuno'] = this.nomealuno;
    data['titulo'] = this.titulo;
    data['nota'] = this.nota;
    return data;
  }
}