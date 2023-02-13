import 'package:flutter/material.dart';

import '../../util/constants.dart';

class UserMenu extends StatelessWidget {
  const UserMenu({
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
            leading: const Icon(Icons.receipt),
            title: const Text("Minhas Receitas"),
            onTap: () => Navigator.pushNamed(context, '/login'),
          ),
          ListTile(
            leading: const Icon(Icons.person_pin),
            title: const Text("Perfil"),
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
