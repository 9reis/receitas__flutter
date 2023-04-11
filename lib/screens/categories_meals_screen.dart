import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:receitas__flutter/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Pega os dados das categorias através dos argumentos passados na rota
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: Center(
        // ONDE IRÁ COLOCAR OS TRECHOS DAS HISTORIAS
        child: Text('Receitas por Categoria - ${category.id}'),
      ),
    );
  }
}
