import 'package:flutter/material.dart';
import 'package:receitas/util/constants.dart';
import 'package:receitas/util/widgets/widget_search.dart';

import '../util/widgets/widget_menu.dart';
import '../util/widgets/widget_usermenu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      drawer: const UserMenu(),
    );
  }
}
