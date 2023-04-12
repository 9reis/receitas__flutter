import 'package:flutter/material.dart';
import 'package:receitas__flutter/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            child: Text(
              'Vamos cozinhar ? ',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //Criando cada item do Drawer
          _createIcon(
            Icons.restaurant,
            'Refeições',
            // Coloca um nova rota e substitui a tela anterior 
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
          ),
          Divider(color: Colors.black38),
          _createIcon(
            Icons.settings,
            'Configurações',
            () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
          ),
          Divider(color: Colors.black38),
        ],
      ),
    );
  }

  Widget _createIcon(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}
