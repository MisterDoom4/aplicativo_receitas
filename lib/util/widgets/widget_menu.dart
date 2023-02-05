import 'package:flutter/material.dart';

import '../constants.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: defaultColor,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.deepOrange,
                  Colors.red,
                ],
              ),
            ),
            child: SizedBox(
              child: Column(
                children: const [
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: logo,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text("Login"),
            onTap: () => Navigator.pushNamed(context, '/login'),
          ),
          ListTile(
            leading: const Icon(Icons.app_registration),
            title: const Text("Cadastrar"),
            onTap: () => Navigator.pushNamed(context, '/register'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Configurações"),
          ),
          const ListTile(
            leading: Icon(Icons.report),
            title: Text("Reportar Bug"),
          ),
        ],
      ),
    );
  }
}
