import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math';

class Welcome extends StatefulWidget {
  @override
  WelcomeState createState() => WelcomeState();
}

class WelcomeState extends State<Welcome> {
  int u, f, l = 10;
  bool w = false, lo = false;
  double a = 1;
  int random = Random().nextInt(100);

  @override
  Widget build(BuildContext context) => _screen();

  Widget _screen() {
    return Scaffold(
        backgroundColor: Colors.blue,
        resizeToAvoidBottomPadding: false,
        body: _mainColumn());
  }

  Widget _mainColumn() {
    return Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
      Container(margin: EdgeInsets.only(top: 40)),
      _guessText(),
      Container(margin: EdgeInsets.only(top: 20)),
      _operation(),
      Container(margin: EdgeInsets.only(top: 0)),
      _userInput(),
      _tryButton(),
      Container(margin: EdgeInsets.only(top: 68)),
      _noOfTries(),
    ]);
  }

  Widget _guessText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Guess the number!",
          style: TextStyle(color: Colors.white, fontSize: 24)),
    );
  }

  Widget _userInput() {
    return Container(
      height: 150,
      width: 300,
      child: TextField(
        onChanged: (value) {
          setState(() {
            u = int.parse(value);
          });
        },
        style: TextStyle(fontSize: 44, color: Colors.white),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: '( 1 - 100 )',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _tryButton() {
    bool _condition= w || lo;
    return Container(
      width: 300,
      height: 80,
      child: RaisedButton(
        onPressed: _condition ? _reset : _setNumber,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(300.0),
        ),
        elevation: 10,
        child: Text(
          _condition ? "RETRY" : "TRY",
          style: TextStyle(color: _condition ? Colors.green[900] : Colors.blue, fontSize: 36),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _noOfTries() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$l guesses left",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        Container(margin: EdgeInsets.only(left: 30)),
        LinearPercentIndicator(
          width: 120.0,
          animation: true,
          animationDuration: 500,
          lineHeight: 30.0,
          percent: a,
          backgroundColor: Colors.blue[400],
          progressColor: Colors.white,
        ),
      ],
    );
  }

  Widget _displayResult(image) {
    return Image(
      image: AssetImage("assets/images/$image.png"),
      height: 180,
      width: 180,
    );
  }

  Widget _operation() {
    if (a == 0.0) {
      setState(() {
        lo = true;
      });
      return _displayResult("lose");
    } else if (f == null) {
      return Container(
        height: 180,
      );
    } else if (f < random) {
      return _displayResult("up");
    } else if (f > random) {
      return _displayResult("down");
    } else if (f == random) {
      setState(() {
        w = true;
      });
      return _displayResult("win");
    }
  }

  void _setNumber() {
    if (!w) {
      setState(() {
        if (a >= 0.1) {
          a = double.parse(a.toStringAsPrecision(2)) - 0.1;
          l -= 1;
        }
        f = u;
      });
    }
  }

  void _reset() {
    setState(() {
      f = null;
      w = false;
      lo = false;
      a = 1;
      l = 10;
      random = new Random().nextInt(100);
    });
  }
}
