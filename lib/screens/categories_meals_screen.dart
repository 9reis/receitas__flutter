import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:receitas__flutter/components/meal_item.dart';
import 'package:receitas__flutter/data/dummy_data.dart';
import 'package:receitas__flutter/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Pega os dados das categorias através dos argumentos passados na rota
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    // Percorre a lista de refeicoes e pega cada item
    final categoryMeals = DUMMY_MEALS.where((meal) {
      // Pega cada refeição de acordo com a categoria
      // clicada na lista de categorias
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
          centerTitle: true,
        ),
        body: ListView.builder(
          // Total de itens na lista de refeições
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(categoryMeals[index]);
          },
        ));
  }
}
