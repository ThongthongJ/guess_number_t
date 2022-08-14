import 'package:flutter/material.dart';
import 'package:guess_number_t/game.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = TextEditingController();
  final _game = Game();
  var _feedbackText = '';
  var _showTestButton = false;

  void handleClickGuesss() {
    print(_controller.text);
    var guess = int.tryParse(_controller.text);
    setState(() {
      _showTestButton = !_showTestButton;
    });

    if (guess == null) {
      print('Input error');
      setState(() {
        _feedbackText = 'Input error, please try again 🤔🤔🤔🤔';
      });
    } else {
      var result = _game.doGuess(guess);

      if (result == Result.tooLow) {
        print('too low');
        setState(() {
          _feedbackText = 'too Low';
        });
      } else if (result == Result.tooHigh) {
        print('too high');
        setState(() {
          _feedbackText = 'too High';
        });
      } else {
        print('is correct');
        setState(() {
          _feedbackText = 'is Correct';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guess the Number'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Please enter the number between 1 and 100'),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a Number'),
            ),
            ElevatedButton(onPressed: handleClickGuesss, child: Text('GUESS')),
            Text(
              _feedbackText,
              style: TextStyle(fontSize: 30),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('Text'),
              style: OutlinedButton.styleFrom(
                  primary: _showTestButton ? Colors.white : Colors.black,
                  backgroundColor: _showTestButton ? Colors.blue : Colors.teal),
            ),
            Icon(Icons.print),
          ],
        ),
      ),
    );
  }
}
