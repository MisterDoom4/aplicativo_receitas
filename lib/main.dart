import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:receitas/util/constants.dart';

import 'firebase_options.dart';
import 'util/routes/route_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppEntry());
}

class AppEntry extends StatefulWidget {
  const AppEntry({super.key});

  @override
  State<AppEntry> createState() => _AppEntry();
}

class _AppEntry extends State<AppEntry> {
  late Future<Results> futureAlbum;
  late Future<Album> recipe;

  @override
  void initState() {
    super.initState();
    // futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: appMaterialColor,
      ),
      initialRoute: '/',
      onGenerateRoute: GenerateAllRoutes.generateRoute,
    );
    // return MaterialApp(
    //   theme: ThemeData(primarySwatch: Colors.orange),
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: const Text("Teste"),
    //     ),
    //     body: FutureBuilder<Results>(
    //       future: futureAlbum,
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           return ListView(children: [
    //             Text(
    //               snapshot.data!.resultados[0]['analyzedInstructions'][0]
    //                   ['name'],
    //               style: const TextStyle(fontWeight: FontWeight.bold),
    //             ),
    //             // Image(image: NetworkImage(snapshot.data!.image)),
    //           ]);
    //         } else if (snapshot.hasError) {
    //           return Text('${snapshot.error}');
    //         }

    //         // By default, show a loading spinner.
    //         return const CircularProgressIndicator();
    //       },
    //     ),
    //   ),
    // );
  }
}

class Album {
  final String title;
  final String image;

  const Album({
    required this.title,
    required this.image,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['title'],
      image: json['image'],
    );
  }
}

class Results {
  final List<dynamic> resultados;
  const Results({required this.resultados});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(resultados: json['recipes']);
  }
}

Future<Results> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://api.spoonacular.com/recipes/random?apiKey=287f216933084c278908c14d55470e99&number=2'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Results.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
