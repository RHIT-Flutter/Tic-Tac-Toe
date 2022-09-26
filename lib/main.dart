import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Models/TicTacToeModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      theme: ThemeData(
        // This is the theme of your application.
        //s
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Tic-Tac-Toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _gameState = "Start Game";
  var _gameModel = TicTacToeModel();
  var _buttonTitles = List.generate(9, (index) => " ", growable: false);

  void _setGameState(String newState) {
    setState(() {
      _gameState = newState;
    });
  }

  void _startGame() {
    setState(() {
      _gameModel = TicTacToeModel();
      _gameState = _gameModel.gameState;
      _buttonTitles = List.generate(9, (index) => " ", growable: false);
    });
  }

  void _pressButtonAt(int row, int col) {
    setState(() {
      _gameModel.pressButtonAt(row, col);
      _gameState = _gameModel.gameState;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                '$_gameState',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)
              ),
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  crossAxisCount: 3),
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 24, right: 24),
                children: <ElevatedButton>[
                  ElevatedButton(onPressed: (() {
                    //print("Button 0 pressed");
                    this._pressButtonAt(0, 0);
                    setState(() {
                      _buttonTitles[0] = _gameModel.stringForButton(0, 0);
                    });
                  }), child: Text('${_buttonTitles[0]}', style: TextStyle(fontSize: 30),)),
                  ElevatedButton(onPressed: (() {
                    //print("Button 1 pressed");
                    this._pressButtonAt(0, 1);
                    setState(() {
                      _buttonTitles[1] = _gameModel.stringForButton(0, 1);
                    });
                  }), child: Text('${_buttonTitles[1]}', style: TextStyle(fontSize: 30))),
                  ElevatedButton(onPressed: (() {
                    //print("Button 2 pressed");
                    this._pressButtonAt(0, 2);
                    setState(() {
                      _buttonTitles[2] = _gameModel.stringForButton(0, 2);
                    });
                  }), child: Text('${_buttonTitles[2]}', style: TextStyle(fontSize: 30))),
                  ElevatedButton(onPressed: (() {
                    //print("Button 3 pressed");
                    this._pressButtonAt(1, 0);
                    setState(() {
                      _buttonTitles[3] = _gameModel.stringForButton(1, 0);
                    });
                  }), child: Text('${_buttonTitles[3]}', style: TextStyle(fontSize: 30))),
                  ElevatedButton(onPressed: (() {
                    //print("Button 4 pressed");
                    this._pressButtonAt(1, 1);
                    setState(() {
                      _buttonTitles[4] = _gameModel.stringForButton(1, 1);
                    });
                  }), child: Text('${_buttonTitles[4]}', style: TextStyle(fontSize: 30))),
                  ElevatedButton(onPressed: (() {
                    //print("Button 5 pressed");
                    this._pressButtonAt(1, 2);
                    setState(() {
                      _buttonTitles[5] = _gameModel.stringForButton(1, 2);
                    });
                  }), child: Text('${_buttonTitles[5]}', style: TextStyle(fontSize: 30))),
                  ElevatedButton(onPressed: (() {
                    //print("Button 6 pressed");
                    this._pressButtonAt(2, 0);
                    setState(() {
                      _buttonTitles[6] = _gameModel.stringForButton(2, 0);
                    });
                  }), child: Text('${_buttonTitles[6]}', style: TextStyle(fontSize: 30))),
                  ElevatedButton(onPressed: (() {
                    //print("Button 7 pressed");
                    this._pressButtonAt(2, 1);
                    setState(() {
                      _buttonTitles[7] = _gameModel.stringForButton(2, 1);
                    });
                  }), child: Text('${_buttonTitles[7]}', style: TextStyle(fontSize: 30))),
                  ElevatedButton(onPressed: (() {
                    //print("Button 8 pressed");
                    this._pressButtonAt(2, 2);
                    setState(() {
                      _buttonTitles[8] = _gameModel.stringForButton(2, 2);
                    });
                  }), child: Text('${_buttonTitles[8]}', style: TextStyle(fontSize: 30))),
                ],
              ),
              ElevatedButton(onPressed: ((){
                //print("New Game pressed");
                this._startGame();
              }), child: Text("New Game")),
            ], // children
        ),
      ),
    );
  }
}
