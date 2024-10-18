import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_sqlite/view/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cadastro de Pessoas',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
