import 'package:flutter/material.dart';
import 'package:receitas__flutter/screens/categories_meals_screen.dart';
import 'package:receitas__flutter/screens/categories_screen.dart';
import 'package:receitas__flutter/screens/meal_detail_screen.dart';
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
        AppRoutes.HOME: (ctx) => CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
      },
      // Só entra nessa metodo caso a rota que tentou acessa não exista
      // Recebe a rota que tentou acessar
      // onGenerateRoute: ((settings) {
      //   // Func utilizada para definir rotas dinamicamente
      //   if (settings.name == '/alguma-coisa') {
      //     return null;
      //   } else if (settings.name == '/outra-coisa') {
      //     return null;
      //   } else {
      //     return MaterialPageRoute(builder: (_) {
      //       return CategoriesScreen();
      //     });
      //   }
      // }),

      //Metodo parecido com o 404
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(builder: (_) {
          return CategoriesScreen();
        });
      }),
    );
  }
}
