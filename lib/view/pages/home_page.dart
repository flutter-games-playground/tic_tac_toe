import 'package:flutter/material.dart';
import 'package:tic_tac_toe/view/widgets/campo.dart';
import 'package:tic_tac_toe/view_model/game_type_abstract.dart';

class HomePage extends StatefulWidget {
  final String userName;
  final String tableName;
  final GameTypeAbstract controller;

  const HomePage({super.key, required this.userName, required this.tableName, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.controller.tableName = widget.tableName;
    widget.controller.getDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
            children: [
              Table(
                border: const TableBorder.symmetric(
                  inside: BorderSide(color: Colors.black, width: 3),
                  outside: BorderSide.none,
                ),
                children: [
                  TableRow(
                    children: [
                      Campo(key: const Key('1'), controller: widget.controller),
                      Campo(key: const Key('2'), controller: widget.controller),
                      Campo(key: const Key('3'), controller: widget.controller),
                    ],
                  ),
                  TableRow(
                    children: [
                      Campo(key: const Key('4'), controller: widget.controller),
                      Campo(key: const Key('5'), controller: widget.controller),
                      Campo(key: const Key('6'), controller: widget.controller),
                    ],
                  ),
                  TableRow(
                    children: [
                      Campo(key: const Key('7'), controller: widget.controller),
                      Campo(key: const Key('8'), controller: widget.controller),
                      Campo(key: const Key('9'), controller: widget.controller),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  widget.controller.zerarJogo();
                },
                child: const Text('Reiniciar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
