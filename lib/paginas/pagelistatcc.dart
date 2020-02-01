import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert' as converte; 


import '../modelo/monografia.dart';
import 'pageavaliatcc.dart';

class PageListatcc extends StatefulWidget {
  @override
  _PageListatccState createState() => _PageListatccState();
}

class _PageListatccState extends State<PageListatcc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(6),
        child: _montarlistadinamica(context)
      ),
    );
    
  }

  _montarlistadinamica(BuildContext context){
    //O FutureBuilder diferente do Future simples, permite retornar um Widget
    //Nesta implementação usaremos ele para retornar um Listview preenchido
    //com dados vindos da Internet.
    //Em seu construtor temos o "future" que será o local de recebimento dos
    //dados e "builder" que recebe um função que tem como parâmetro o "contexto" e o
    //snapshot que "guarda" os dados a serem recebidos a partir de uma ação assíncrona.
    return FutureBuilder(
      future: _buscardados(),
      builder: (context,snapshot){
        //Se já tiver os dados, ele chama a função que cria a ListView
        //Perceba que a função recebe o snapshot.data, dentro deste recurso estarão os dados
        //a serem apresentados no ListView 
        if (snapshot.hasData) {
          return _crialistview(snapshot.data);
        } else {
          //Enquanto a Future não tem os dados, ele apresenta um CircularProgress
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }

  Future<List<Monografia>> _buscardados() async{
    List<Monografia> lista = new List<Monografia>();

    String url = "https://api.myjson.com/bins/136se2";

    http.Response resposta = await http.get(url);
    if(resposta.statusCode == HttpStatus.ok){
      //A chamada aconteceu com sucesso
      var listaretorno = converte.jsonDecode(resposta.body);
      for (var mono in listaretorno) {
        //Transformamos nosso mapa em um objeto Monografia
        Monografia objmono = Monografia.fromJson(mono);
        lista.add(objmono);
      }
    }
    else{
      //Falha ao chamar o serviço
      print("Falha ao receber os dados da Internet.");
    }
    
    return Future.value(lista);
  }

  _crialistview(listamono){
    return ListView.builder(
      itemCount: listamono.length,
      itemBuilder: (context,index){
        //Recuperamos um objeto que estava dentro da Lista retornada pelo
        //FutureBuilder (snapshot.data)
        Monografia itemmono = listamono[index];
        //Aqui tomamos uma decisão baseado na nota do aluno
        //Se a nota do aluno for "0.0", estamos considerando que ele ainda não
        //foi avaliado, mudando a imagem a ser apresentada na lista
        String urlimagem = "";
        if (itemmono.nota == 0.0) {
          urlimagem = "assets/images/navaliado.png";
        }else {
          urlimagem = "assets/images/avaliado.png";
        }

        return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(urlimagem),
            ),
            title: Text(itemmono.nomealuno),
            subtitle: Text(itemmono.titulo),
            trailing: Text(itemmono.nota.toString()),
            onTap: (){
              //Ao clicar no item da lista ele irá chamar esta função
              //Em nosso caso, vamos navegar para uma próxima página
              Navigator.push(context, MaterialPageRoute(builder: (context){
                  //O return indica para onde iremos navegar, neste caso para PageAvaliaTcc
                  return PageAvaliaTcc(itemmono);
              }));
            },
        );
      },
    ); 
  }
}