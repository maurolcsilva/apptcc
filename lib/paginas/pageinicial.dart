import 'package:flutter/material.dart';
import 'pagelistatcc.dart';

class PageInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppTCC'),
        centerTitle: true,
      ),
      body: _body(context),
      
    );
  }

  _body(BuildContext context){
    return Container(
      color: Colors.orange,
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(6),
      child: Column(
        children: <Widget>[
          _imagem('assets/images/logotcc.png'),
          _texto('Avaliação de TCC'),
          _botao(context),
        ],
      ),
    );
  }

  _imagem(String url){
    return Image.asset(url);
  }

  _texto(String txt){
    return Text(txt,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),);
  }

  _botao(BuildContext context){
    return RaisedButton(
      child: Text('AVANÇAR'),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:(context){
          return PageListatcc();
        }));
      },
    );
  }
}