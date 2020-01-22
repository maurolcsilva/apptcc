import 'package:flutter/material.dart';

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
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avaliado.png'),
              ),
              title: Text('Mauro Lopes Carvalho Silva'),
              subtitle: Text('Analisando o perfil do programador de SI'),
              trailing: Text('7.5'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avaliado.png'),
              ),
              title: Text('Mauro Lopes Carvalho Silva'),
              subtitle: Text('Analisando o perfil do programador de SI'),
              trailing: Text('7.5'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/navaliado.png'),
              ),
              title: Text('Mauro Lopes Carvalho Silva'),
              subtitle: Text('Analisando o perfil do programador de SI'),
              trailing: Text('7.5'),
            ),
          ],
        ),
      ),
    );
  }
}