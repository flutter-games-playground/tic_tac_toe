import 'package:flutter/material.dart';
import 'package:tic_tac_toe/main.dart';

class RegisterPage extends StatefulWidget {
  final String tableName;

  const RegisterPage({super.key, required this.tableName});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

const gameMode = ['Normal', 'Infinity'];

class _RegisterPageState extends State<RegisterPage> {
  String gameModeSelected = gameMode[0];

  final tableController = TextEditingController();
  final nameController = TextEditingController(text: sharedPreferences.getString('userName'));

  @override
  void initState() {
    tableController.text = widget.tableName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      labelText: 'Informe seu nome.',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250,
                  // height: 60,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(gameMode[0]),
                        leading: Radio(
                          value: gameMode[0],
                          onChanged: (value) {
                            setState(() {
                              gameModeSelected = value.toString();
                            });
                          },
                          groupValue: gameModeSelected,
                        ),
                      ),
                      ListTile(
                        title: Text(gameMode[1]),
                        leading: Radio(
                          value: gameMode[1],
                          onChanged: (value) {
                            setState(() {
                              gameModeSelected = value.toString();
                            });
                          },
                          groupValue: gameModeSelected,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: widget.tableName.isEmpty,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: tableController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        labelText: 'Informe o nome da mesa.',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton(
                  onPressed: () {
                    sharedPreferences.setString('userName', nameController.text);
                    Navigator.of(context).pushNamed('/?table=${tableController.text}&gameMode=$gameModeSelected');
                  },
                  child: const Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
