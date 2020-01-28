import 'package:flutter/material.dart';

import '../modelo/monografia.dart';

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
        child: _montarlistadinamica()
      ),
    );
    
  }

  _montarlistadinamica(){
    List<Monografia> listamono = new List<Monografia>();
    
    Monografia mono1 = new Monografia('Mauro Lopes Carvalho Silva', 'Analisando o perfil do programador de SI', 7.5);
    Monografia mono2 = new Monografia('Carla Silva', 'Programando em Flutter', 9.5);
    Monografia mono3 = new Monografia('Pedro Cesar', 'IOT', 8.5);

    listamono.add(mono1);
    listamono.add(mono2);
    listamono.add(mono3);

    return ListView.builder(
      itemCount: listamono.length,
      itemBuilder: (context,index){
        Monografia itemmono = listamono[index];

        return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/navaliado.png'),
            ),
            title: Text(itemmono.nomedoaluno),
            subtitle: Text(itemmono.titulo),
            trailing: Text(itemmono.nota.toString()),
        );
      },
    );
  }
}