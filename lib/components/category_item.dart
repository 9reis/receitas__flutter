import 'package:flutter/material.dart';
import 'package:receitas__flutter/models/category.dart';
import 'package:receitas__flutter/screens/categories_meals_screen.dart';
import 'package:receitas__flutter/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      //Cor do efeito ao clicar
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
          ),
        ),
      ),
      onTap: () => _selectCategory(context),
    );
  }

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.CATEGORIES_MEALS,
        // Argumentos que deseja passar para rota
        arguments: category);
  }
}
