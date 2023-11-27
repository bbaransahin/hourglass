import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  final minutesController = TextEditingController();
  Timer? matimer;
  bool isTicking = false;

  void dispose() {
    minutesController.dispose();
    super.dispose();
  }

  void _startTimer() {
    if (!isTicking) {
        setState(() {
            _hours = int.parse(minutesController.text)~/60;
            _minutes = int.parse(minutesController.text)%60;
            _seconds = 0;
        });
        matimer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
        isTicking = true;
    }
  }

  void _stopTimer() {
    if (isTicking) {
        setState(() => matimer?.cancel());
        isTicking = false;
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Remaining..',
            ),
            TextField(
              controller: minutesController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Minutes to study',
              ),
            ),
            Text(
              '$_hours:$_minutes:$_seconds',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: _startTimer,
                child: Text('start'),
            ),
            ElevatedButton(
                onPressed: _stopTimer,
                child: Text('pause'),
            ),
          ],
        ),
      ),
    );
  }
}
