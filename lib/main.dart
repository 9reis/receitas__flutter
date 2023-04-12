import 'package:flutter/material.dart';
import 'package:receitas__flutter/data/dummy_data.dart';
import 'package:receitas__flutter/models/meal.dart';
import 'package:receitas__flutter/models/settings.dart';
import 'package:receitas__flutter/screens/categories_meals_screen.dart';
import 'package:receitas__flutter/screens/categories_screen.dart';
import 'package:receitas__flutter/screens/meal_detail_screen.dart';
import 'package:receitas__flutter/screens/settings_screen.dart';
import 'package:receitas__flutter/screens/tabs_screen.dart';
import 'package:receitas__flutter/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Armazena o estado e as configurações setadas na tela de config
  Settings settings = Settings();

  // Pega todas as comidas
  List<Meal> _availableMeals = DUMMY_MEALS;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        secondaryHeaderColor: Colors.red,
        accentColor: Colors.amber,
        fontFamily: 'Releway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        // Define o CategoriesScreen como rota inicial
        AppRoutes.HOME: (ctx) => TabsScreen(),
        // Passa as refeições para o componente que exibe por categoria
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(_filterMeals, settings),
      },
    );
  }

// Chamado sempre que mudar a configuração
// FIltra as refeições
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGlutten = settings.isGluttenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegeterian = settings.isVegetarian && !meal.isVegetarian;
        // Se não caiu em nenhum dos filtros, a comida deve ser exibida
        return !filterGlutten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegeterian;
        // Se algum dos filtros derem verdadeiro, a cumida não deve ser exibida
      }).toList();
    });
  }
}
