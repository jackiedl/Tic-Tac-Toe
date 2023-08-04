import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class DialogGridView extends StatelessWidget {
  final List<String> board;
  const DialogGridView({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: board.map((square) => 
        GridTile(
          child: Container(
            color: square == "" ? Colors.white : square == "X" ? kPlayerXactiveColor : kPlayerOactiveColor,
          ),
        )
      ).toList(),
    );
  }
}