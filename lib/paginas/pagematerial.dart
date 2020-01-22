import 'package:flutter/material.dart';
import 'pageinicial.dart';

class PageMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppTCC',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home:PageInicial()
    );
  }
}