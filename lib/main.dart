import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: "Contador de pessoa",
      home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _inforText = "Pode entrar";

  void _changePeople(int valor){
    setState(() {
      if(valor == -1 && _people >= 1 || valor == 1 && _people < 10)
        _people += valor;

      if(_people == 10 )
        _inforText = "LOTADO";
      else
        _inforText = "Pode entrar";

      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Opacity(
          opacity: 0.3,
          child: Image.asset(
            "images/logo.png",
            fit: BoxFit.cover,
            height: 1000.0,
          )),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Pessoa: $_people " ,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                child: Text(
                  "+1",
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
                onPressed: () { _changePeople(1);},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                child: Text(
                  "-1",
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
                onPressed: () { _changePeople(-1);},
              ),
            ),
          ]),
          Text(
            _inforText,
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontSize: 30.0,
            ),
          )
        ],
      )
    ]);
  }
}
