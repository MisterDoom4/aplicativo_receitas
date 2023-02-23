import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:receitas/presentation/widgets/widget_category.dart';
import 'package:receitas/presentation/widgets/widget_menu.dart';
import 'package:receitas/presentation/widgets/widget_search.dart';
import 'package:receitas/presentation/widgets/widget_topics.dart';
import 'package:receitas/presentation/widgets/widget_usermenu.dart';
import 'package:receitas/util/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget initMenu;
  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    initMenu = user == null ? const Menu() : const UserMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: logo,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const SearchPage())),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 60,
            child: Category(),
          ),
          Topics(titulo: "Novidades"),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Topics(titulo: 'Receitas mais populares'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Topics(
              titulo: 'Receitas mais curtidas',
            ),
          ),
        ],
      ),
      drawer: initMenu,
    );
  }
}
