import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math';

class welcome extends StatefulWidget {
  @override
  welcomestate createState() => welcomestate();
}

class welcomestate extends State<welcome> {
  int userguess;
  int finalGuess;
  bool won = false;
  double a = 1;
  int lifeCounter = 10;
  final int random = Random().nextInt(100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text("Guess the number!",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 36)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 30, 50, 0),
                child: operation(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Container(
                  height: 150,
                  width: 300,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        userguess = int.parse(value);
                      });
                    },
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 44,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(20.0),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Container(
                  width: 320,
                  height: 100,
                  child: RaisedButton(
                    onPressed: () {
                      if (!won) {
                        setState(() {
                          if (a >= 0.1) {
                            a = double.parse(a.toStringAsPrecision(2)) - 0.1;
                            lifeCounter -= 1;
                          }
                          finalGuess = userguess;
                        });
                      }
                    },
                    color: Colors.white,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(300.0)),
                    elevation: 10,
                    child: Text(
                      "TRY",
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Montserrat',
                          fontSize: 36),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Row(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 30, 10, 0),
                  child: Text(
                    "$lifeCounter guesses Left",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: LinearPercentIndicator(
                    width: 120.0,
                    animation: true,
                    animationDuration: 1500,
                    lineHeight: 30.0,
                    percent: a,
                    backgroundColor: Colors.grey[400],
                    progressColor: Colors.white,
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget displayUpArrow() {
    return Image(
      image: AssetImage("assets/images/up.png"),
      height: 180,
      width: 180,
    );
  }

  Widget displayDownArrow() {
    return Image(
      image: AssetImage("assets/images/down.png"),
      height: 180,
      width: 180,
    );
  }

  Widget displayWin() {
    return Image(
      image: AssetImage("assets/images/win.png"),
      height: 180,
      width: 180,
    );
  }

  Widget displayLose() {
    return Image(
      image: AssetImage("assets/images/lose.png"),
      height: 180,
      width: 180,
    );
  }

  Widget operation() {
    print('$a,${a == 0.0},');
    if (a == 0.0) {
      return displayLose();
    } else if (finalGuess == null) {
      return Container(
        height: 200,
      );
    } else if (finalGuess < random) {
      return displayUpArrow();
    } else if (finalGuess > random) {
      return displayDownArrow();
    } else if (finalGuess == random) {
      setState(() {
        won = true;
      });
      return displayWin();
    }
  }
}
