import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  String _selectedLanguage = 'en';
  
  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  // Load saved preferences
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('darkMode') ?? false;
      _selectedLanguage = prefs.getString('language') ?? 'en';
    });
  }

  // Save theme preference
  Future<void> _toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', isDark);
    setState(() {
      _isDarkMode = isDark;
    });
  }

  // Save language preference
  Future<void> _changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
    setState(() {
      _selectedLanguage = languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Worktency Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: LoginScreen(
        isDarkMode: _isDarkMode,
        selectedLanguage: _selectedLanguage,
        onThemeChanged: _toggleTheme,
        onLanguageChanged: _changeLanguage,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}