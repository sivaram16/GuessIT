import 'welcome.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => welcome(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
            child: Container(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/logo.png"),
              height: 150,
              width: 150,
            ),
            Text(
              "GuessIT",
              style: TextStyle(
                  fontFamily: 'Montserrat', color: Colors.white, fontSize: 24),
            )
          ],
        ))));
  }
}
