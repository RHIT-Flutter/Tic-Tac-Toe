import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tic Tac Toe'),
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
  Icon O = const Icon(
    Icons.panorama_fish_eye,
    size: 50.0,
  );
  Icon X = const Icon(
    Icons.close,
    size: 50.0,
  );

  List<String> tics = List<String>.filled(9, "");
  int turn = 0;
  bool winner = false;
  String display = 'Player Turn: X';

  void _reset() {
    setState((){
      tics = List<String>.filled(9, "");
      turn = 0;
      winner = false;
      display = 'Player Turn: X';
    });
  }

  void _play(int loc) {
    setState(() {
      if (winner || tics[loc] != "") {
        return;
      }
      if (turn % 2 == 1){
        tics[loc] = 'O';
      } else {
        tics[loc] = 'X';
      }
      _checkWinStatus();
      _updateDisplay();
      turn++;
    });
  }

  void _updateDisplay(){
    if (winner) {
      String winningShape = (turn%2==0? "X" : "O");
      display = "$winningShape won!";
    } else if (turn == 8) {
      display = "tie";
    } else if (turn%2==0) {
      display = 'Player Turn: O';
    } else {
      display = 'Player Turn: X';
    }
  }

  void _checkWinStatus() {
    if (turn <= 3) {
      return;
    }

    winner = winner || (tics[0] == tics[4] && tics[0] == tics[8] && tics[0] != "");
    winner = winner || (tics[2] == tics[4] && tics[2] == tics[6] && tics[2] != "");

    for (int i = 0; i < 3 && !winner; i++) {
      winner = winner || (tics[0 + i] == tics[3 + i] && tics[0 + i] == tics[6 + i] && tics[0+i] != "");
      winner = winner || (tics[0 + i*3] == tics[1 + i*3] && tics[0 + i*3] == tics[2 + i*3] && tics[0+i*3] != "");
    }
  }


  Icon? _getIcon(int loc) {
    if (tics[loc] == "O") {
      return O;
    }
    if (tics[loc] == "X") {
      return X;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
          style: TextStyle(
          fontSize: 40,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.5
            ..color = Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(display,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35),
          ),
          GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
                ElevatedButton(onPressed: (){_play(0);}, child: _getIcon(0)),
                ElevatedButton(onPressed: (){_play(1);}, child: _getIcon(1)),
                ElevatedButton(onPressed: (){_play(2);}, child: _getIcon(2)),
                ElevatedButton(onPressed: (){_play(3);}, child: _getIcon(3)),
                ElevatedButton(onPressed: (){_play(4);}, child: _getIcon(4)),
                ElevatedButton(onPressed: (){_play(5);}, child: _getIcon(5)),
                ElevatedButton(onPressed: (){_play(6);}, child: _getIcon(6)),
                ElevatedButton(onPressed: (){_play(7);}, child: _getIcon(7)),
                ElevatedButton(onPressed: (){_play(8);}, child: _getIcon(8)),
              ],
          ),
          ElevatedButton(onPressed: (){_reset();}, child: const Text('restart')),
        ],
      ),
    );
  }
}
