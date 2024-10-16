import 'package:flutter/material.dart';
import 'package:mobile/screen/lista.dart';

class BankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BankingHomePage(),
    );
  }
}
