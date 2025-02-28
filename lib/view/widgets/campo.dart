import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/constants/stats_enum.dart';
import 'package:tic_tac_toe/view_model/game_type_abstract.dart';

class Campo extends StatefulWidget {
  final GameTypeAbstract controller;

  const Campo({super.key, required this.controller});

  @override
  State<Campo> createState() => _CampoState();
}

class _CampoState extends State<Campo> {
  late Color _color = Theme.of(context).scaffoldBackgroundColor;
  late Color _textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    int key = int.parse(widget.key.toString().replaceAll(RegExp(r'\D'), ''));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if ([StatusEnum.sDraw, StatusEnum.sNothing].contains(widget.controller.currentStatus)) {
            if (widget.controller.getCampo(key).isEmpty) {
              widget.controller.setCampo(key);
            }
          }
        },
        child: AnimatedBuilder(
          animation: widget.controller,
          builder: (BuildContext context, Widget? child) {
            final isLast = widget.controller.isLast(key);
            if (!([
              StatusEnum.sDraw,
              StatusEnum.sNothing,
              StatusEnum.sRestart,
            ].contains(widget.controller.currentStatus))) {
              if (widget.controller.fieldsWin.contains(key)) {
                _color = Colors.red;
                _textColor = Colors.white;
              }
            } else {
              _color = Theme.of(context).scaffoldBackgroundColor;
              _textColor = Colors.black.withAlpha(isLast ? 128 : 255);
            }
            return Container(
              width: 50,
              height: 170,
              color: _color,
              child: Center(
                child: Text(widget.controller.getCampo(key), style: TextStyle(fontSize: 64, color: _textColor)),
              ),
            );
          },
        ),
      ),
    );
  }
}
