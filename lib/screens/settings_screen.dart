import 'package:flutter/material.dart';
import 'package:receitas__flutter/components/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuraçoes'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Configurações'),
      ),
    );
  }
}
