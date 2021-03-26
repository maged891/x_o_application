import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(xo_application());
}

class xo_application extends StatefulWidget {
  @override
  _xo_applicationState createState() => _xo_applicationState();
}

class _xo_applicationState extends State<xo_application> {
  List<String> displayxo = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '];
  bool turn = false;
  String winner;
  int xscore = 0;
  int oscore = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'player O',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    Text(
                      oscore.toString(),
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'player X',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    Text(
                      xscore.toString(),
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (turn && displayxo[index] == ' ') {
                        setState(() {
                          displayxo[index] = 'o';
                          turn = !turn;
                        });
                      } else if (!turn && displayxo[index] == ' ') {
                        setState(() {
                          displayxo[index] = 'x';
                          turn = !turn;
                        });
                      }

                      checkowner();
                      score();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          displayxo[index].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 9,
              ),
            ),
            GestureDetector(
              onTap: () {
                playagain();
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                  child: Text(
                    'Play Again',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                endgame();
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(40)),
                child: Center(
                  child: Text(
                    'End Game',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkowner() {
    if (displayxo[0] == displayxo[1] &&
        displayxo[0] == displayxo[2] &&
        displayxo[0] != '') {
      print('${displayxo[0]} is winner ');
      winner = displayxo[0];
    }
    if (displayxo[3] == displayxo[4] &&
        displayxo[3] == displayxo[5] &&
        displayxo[3] != '') {
      print('${displayxo[3]} is winner ');
      winner = displayxo[3];
    }

    if (displayxo[6] == displayxo[7] &&
        displayxo[6] == displayxo[8] &&
        displayxo[6] != '') {
      print('${displayxo[6]} is winner ');
      winner = displayxo[6];
    }

    if (displayxo[0] == displayxo[3] &&
        displayxo[0] == displayxo[6] &&
        displayxo[0] != '') {
      print('${displayxo[0]} is winner ');
      winner = displayxo[0];
    }

    if (displayxo[1] == displayxo[4] &&
        displayxo[1] == displayxo[7] &&
        displayxo[1] != '') {
      print('${displayxo[1]} is winner ');

      winner = displayxo[1];
    }
    if (displayxo[2] == displayxo[5] &&
        displayxo[2] == displayxo[8] &&
        displayxo[2] != '') {
      print('${displayxo[8]} is winner ');
      winner = displayxo[8];
    }

    if (displayxo[0] == displayxo[4] &&
        displayxo[0] == displayxo[8] &&
        displayxo[0] != '') {
      print('${displayxo[0]} is winner ');
      winner = displayxo[0];
    }
    if (displayxo[2] == displayxo[4] &&
        displayxo[2] == displayxo[6] &&
        displayxo[2] != '') {
      print('${displayxo[2]} is winner ');
      winner = displayxo[2];
    } else {
      print('Draw');
    }
  }

  void score() {
    if (winner == 'o') {
      setState(() {
        winner = ' ';
        oscore++;
      });
    } else if (winner == 'x') {
      setState(() {
        winner = ' ';
        xscore++;
      });
    }
  }

  void playagain() {
    for (int i = 0; i <= 8; i++) {
      setState(() {
        displayxo[i] = ' ';
      });
    }
  }

  void endgame() {
    for (int i = 0; i <= 8; i++) {
      setState(() {
        displayxo[i] = ' ';
      });
    }
    setState(() {
      xscore = 0;
      oscore = 0;
    });
  }
}
