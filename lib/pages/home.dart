import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/dialog_gridview.dart';
import 'package:tic_tac_toe/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int turns = 1;
  bool _isTurnX = true;
  // bool _isComputerX = false;
  // bool _isComputerO = false;

  List<String> board = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TIC TAC TOE",
          style: kHeaderTextStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildPlayer(_isTurnX ? kPlayerXactiveColor : kPlayerXinactiveColor),
          _buildBoard(),
          _buildPlayer(_isTurnX ? kPlayerOinactiveColor : kPlayerOactiveColor),
        ],
      ),
      
    );
  }
  // Widget for score board of game (future feature add toggle to switch to AI player)
  Widget _buildPlayer(Color color){
    return Expanded(
      flex: 1,
      child: Card(
        color: color,
        child: const Center(
          child: Text(
            "",
            style: kBodyTextStyle,
          ),
        ),
        
      )
    );
  }

  // Widget for game board 
  Widget _buildBoard(){
    return Expanded(
      flex: 2,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ), 
        itemCount: 9,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: () => insert(index),
            child: Card(
              child: Center(
                child: Container(
                  color: board[index] == "" ? Colors.white : board[index] == "X" ? kPlayerXactiveColor : kPlayerOactiveColor,
                )
              ),
            ),
          );
        },
      )
    );
  }

  // method for choosing a tile
  void insert(int index){
    //can only choose empty squares
    String current = _isTurnX ? "X" : "O";
    if (board[index] == ""){
      setState(() {
        board[index] = current;
      });
      checkWin();
    }
    //check if game is over and setstate accordingly
    return;
  }

  // check if the current player won
  void checkWin(){
    String current = _isTurnX ? "X" : "O";
    
    if (
      (board[0] == current && board[1] == current && board[2] == current) ||
      (board[3] == current && board[4] == current && board[5] == current) ||
      (board[6] == current && board[7] == current && board[8] == current) ||

      (board[0] == current && board[3] == current && board[6] == current) ||
      (board[1] == current && board[4] == current && board[7] == current) ||
      (board[2] == current && board[5] == current && board[8] == current) ||

      (board[0] == current && board[4] == current && board[8] == current) ||
      (board[2] == current && board[4] == current && board[6] == current))
    {
      showAlertDialog(current, "WINNER");
    }
    else if (turns >= 9){
      showAlertDialog(current, "TIE GAME");
    }
    else{
      _isTurnX = !_isTurnX;
      turns++;
    }
  }

  void showAlertDialog(String winner, String mode){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Center(
          child: Text(
            mode,
            style: kHeaderTextStyle,
          ),
        ),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * .30,
          width: MediaQuery.of(context).size.width * .7,
          child: DialogGridView(board: board),
        ),
        actions: [
          Center(
            child: TextButton(
              style: kButtonStyle,
              onPressed: () => Navigator.pop(context), 
              child: const Text(
                "Play again",
                style: kButtonTextStyle,
              )),
          )
        ],
      ) 
    ).then(
      (value) => {
        setState(() {
          resetGame();
        })
      }
    );
  }

  void resetGame(){
    for(int i = 0; i < 9; i++){
        board[i] = "";
      }
    _isTurnX = true;
    turns = 1;
  }
}

