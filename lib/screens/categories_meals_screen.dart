import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:receitas__flutter/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        // ONDE IRÁ COLOCAR OS TRECHOS DAS HISTORIAS
        child: Text('Receitas por Categoria - ${category.id}'),
      ),
    );
  }
}
