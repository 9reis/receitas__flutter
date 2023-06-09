import 'package:flutter/material.dart';
import 'package:receitas__flutter/components/main_drawer.dart';
import 'package:receitas__flutter/models/meal.dart';
import 'package:receitas__flutter/screens/categories_screen.dart';
import 'package:receitas__flutter/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favoriteMeals);

  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  List<Map<String, Object>>? _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals)
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_screens![_selectedScreenIndex]['title'] as String),
      ),
      // Icone na appBar que abre um menu lateral
      drawer: MainDrawer(),
      body: _screens![_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        // Marca o item selecionado
        currentIndex: _selectedScreenIndex,
        // Animação ao clicar no item da Tab
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
        onTap: _selectScreen,
      ),
    );
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }
}
