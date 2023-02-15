import 'package:flutter/material.dart';
import 'package:receitas/util/globals.dart' as globals;
import '../../util/constants.dart';
import '../controllers/fire_auth.dart';
import '../screens/home.dart';

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
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Logout"),
              onTap: () async {
                await FireAuth.signOut();
                globals.userLogin = null;
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Logout realizado com sucesso!"),
                    ),
                  );
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                    ModalRoute.withName('/'),
                  );
                }
              }),
        ],
      ),
    );
  }
}
