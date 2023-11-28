import "package:flutter/material.dart";
import "globals.dart";

class SettingsPage extends StatefulWidget {
    @override
    _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Settings'),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        TextField(
                            controller: studyTimeController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Study time in minutes',
                            ),
                        ),
                        TextField(
                            controller: breakTimeController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Break time in minutes',
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
