import "package:flutter/material.dart";

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
                child: Text('this is settings menu'),
            ),
        );
    }
}
