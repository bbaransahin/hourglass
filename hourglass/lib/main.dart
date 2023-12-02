import 'package:flutter/material.dart';
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'settings_page.dart';
import 'globals.dart';
import 'database_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hourglass',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hourglass Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int length_of_session = 0;
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  Timer? matimer;
  bool isTicking = false;
  String status = "Be ready.";
  Icon playButtonIcon = Icon(Icons.play_arrow, size: 48.0);
  final tagController = TextEditingController();

  void settingsButtonPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()),);
  }

  void _playButtonPressed() {
    if (!isTicking) {
        _startTimer();
    } else {
        _stopTimer();
    }
  }

  void _resetTimer() {
    int losc = length_of_session-60*_hours-_minutes; /// length of session completed
    if (_seconds > 0) {
        losc = losc-1;
    }
    if (losc > 0) {
        add_session(losc ,tagController.text);
    }
    setState(() {
        _hours = int.parse(studyTimeController.text)~/60;
        _minutes = int.parse(studyTimeController.text)%60;
        _seconds = 0;
    });
    _stopTimer();
  }

  void _startTimer() {
    if (!isTicking) {
        setState(() {
            if (_hours == 0 && _minutes == 0 && _seconds == 0) {
                _hours = int.parse(studyTimeController.text)~/60;
                _minutes = int.parse(studyTimeController.text)%60;
                _seconds = 0;
                length_of_session = 60*_hours+_minutes;
            }
            status = "Stay focused!";
            playButtonIcon = Icon(Icons.pause, size: 48.0);
        });
        matimer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
        isTicking = true;
    }
  }

  void _stopTimer() {
    if (isTicking) {
        setState(() => matimer?.cancel());
        isTicking = false;
        status = "Well done!";
        playButtonIcon = Icon(Icons.play_arrow, size: 48.0);
    }
  }

  void setCountDown() {
    setState(() {
        if (_seconds == 0) {
            if (_minutes == 0) {
                if (_hours == 0) {
                    _stopTimer();
                }
                _hours = _hours-1;
                _minutes = 59;
                _seconds = 59;
            } else {
                _minutes = _minutes-1;
                _seconds = 59;
            }
        } else {
            _seconds = _seconds-1;
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(
                icon: Icon(Icons.settings, size:48.0),
                onPressed: settingsButtonPressed,
            ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                controller: tagController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'What do you study?',
                ),
            ),
            Text(
              '$status',
            ),
            Container(
                alignment: Alignment.center,
                width: 300.0,
                height: 150.0,
                ///padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  '$_hours:$_minutes:$_seconds',
                  style: TextStyle(
                    fontSize: 60.0,
                  ),
                ),
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                IconButton(
                    onPressed: _playButtonPressed,
                    icon: playButtonIcon,
                ),
                IconButton(
                    onPressed: _resetTimer,
                    icon: Icon(Icons.stop, size: 48.0),
                ),
                ],
            ),
          ],
        ),
      ),
    );
  }
}
