import 'package:flutter/material.dart';

class Topics extends StatefulWidget {
  final String titulo;
  const Topics({super.key, required this.titulo});

  @override
  State<Topics> createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: Column(
          children: [
            Text(widget.titulo,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
            const Text('Imagens'),
          ],
        ));
  }
}
