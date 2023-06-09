import 'package:flutter/material.dart';
import 'package:tic_tac_toe/presenter/controllers/game_controller.dart';
import 'package:tic_tac_toe/presenter/widgets/campo.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GameController controller = GameController();

  @override
  void initState() {
    controller.getDados();
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
                border: TableBorder.symmetric(
                  inside: const BorderSide(
                    color: Colors.black,
                    width: 3,
                  ),
                  outside: BorderSide.none,
                ),
                children: [
                  TableRow(
                    children: [
                      Campo(key: const Key('1'), controller: controller),
                      Campo(key: const Key('2'), controller: controller),
                      Campo(key: const Key('3'), controller: controller),
                    ],
                  ),
                  TableRow(
                    children: [
                      Campo(key: const Key('4'), controller: controller),
                      Campo(key: const Key('5'), controller: controller),
                      Campo(key: const Key('6'), controller: controller),
                    ],
                  ),
                  TableRow(
                    children: [
                      Campo(key: const Key('7'), controller: controller),
                      Campo(key: const Key('8'), controller: controller),
                      Campo(key: const Key('9'), controller: controller),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  controller.zerarJogo();
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
