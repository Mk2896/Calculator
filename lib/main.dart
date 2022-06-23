import 'dart:convert';
import 'dart:developer';

import 'package:calculator/models/calculations.dart';
import 'package:calculator/models/theme.dart';
import 'package:calculator/screens/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _getPreference();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      _prefs.then((SharedPreferences prefs) {
        return prefs.setString('history', jsonEncode(Calculation.myHistory));
      });
    }

    if (state == AppLifecycleState.resumed) {
      _getPreference();
    }
  }

  void _getPreference() {
    _prefs.then((SharedPreferences prefs) {
      String? result = prefs.getString('history');
      if (result != null) {
        Calculation.myHistory = jsonDecode(result);
      } else {
        Calculation.myHistory = {};
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeClass.darkTheme,
      theme: ThemeClass.lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}
