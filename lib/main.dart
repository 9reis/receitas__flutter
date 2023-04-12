import 'package:flutter/material.dart';
import 'package:receitas__flutter/screens/categories_meals_screen.dart';
import 'package:receitas__flutter/screens/categories_screen.dart';
import 'package:receitas__flutter/screens/meal_detail_screen.dart';
import 'package:receitas__flutter/screens/settings_screen.dart';
import 'package:receitas__flutter/screens/tabs_screen.dart';
import 'package:receitas__flutter/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(),
      },
    );
  }
}
