import 'package:flutter/material.dart';
import '../modelo/monografia.dart';

class PageAvaliaTcc extends StatelessWidget {
  final Monografia mono;

  PageAvaliaTcc(this.mono);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avalia o TCC'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        _textocabecalho_negrito(mono.nomealuno),
        _textocabecalho_normal(mono.titulo),
        ],        
      ),
    );
  }

  _textocabecalho_negrito(String txt){
    return Text(txt, style:TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold
    ));
  }

  _textocabecalho_normal(String txt){
    return Text(txt, style:TextStyle(
      fontSize: 20,
    ));
  }
}