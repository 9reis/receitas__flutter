import 'package:flutter/material.dart';
import 'package:receitas__flutter/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Text('Detalhes da Refeição'),
    );
  }
}
