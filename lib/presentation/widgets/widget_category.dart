import 'package:flutter/material.dart';

import '../../util/constants.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  print('teste1');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(defaultColor),
                  overlayColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text(
                  'teste1',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  print('teste2');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(defaultColor),
                  overlayColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text(
                  'teste2',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  print('teste3');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(defaultColor),
                  overlayColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text(
                  'teste3',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  print('teste4');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(defaultColor),
                  overlayColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text(
                  'teste4',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  print('teste5');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(defaultColor),
                  overlayColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text(
                  'teste5',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  print('teste6');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(defaultColor),
                  overlayColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text(
                  'teste6',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  print('teste7');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(defaultColor),
                  overlayColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text(
                  'teste7',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
