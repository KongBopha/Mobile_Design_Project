import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final bool isDarkMode;
  final String selectedLanguage;
  final Function(bool) onThemeChanged;
  final Function(String) onLanguageChanged;

  const LoginScreen({
    Key? key,
    required this.isDarkMode,
    required this.selectedLanguage,
    required this.onThemeChanged,
    required this.onLanguageChanged,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Map<String, Map<String, String>> localizedStrings = {
    'en': {
      'greeting': 'Hello!',
      'login': 'Log in',
      'connexion': 'Log in',
      'username': 'Username',
      'password': 'Password',
      'darkMode': 'Dark Mode',
    },
    'fr': {
      'greeting': 'Salut!',
      'login': 'Connexion',
      'connexion': 'Connexion',
      'username': 'Nom d\'utilisateur',
      'password': 'Mot de passe',
      'darkMode': 'Mode sombre',
    },
    'kh': {
      'greeting': 'សួស្ដី!',
      'login': 'ចូល',
      'connexion': 'ចូល',
      'username': 'ឈ្មោះអ្នកប្រើប្រាស់',
      'password': 'ពាក្យសម្ងាត់',
      'darkMode': 'ងងឹតពិន',
    },
  };

  String _getText(String key) {
    return localizedStrings[widget.selectedLanguage]?[key] ?? key;
  }

  void _onLogin() {
    print('Username: ${_usernameController.text}');
    print('Password: ${_passwordController.text}');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Login attempted with ${_usernameController.text}'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
  child: LayoutBuilder(
    builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.orange,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Text(
                      _getText('login'),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child: Image.asset(
                            'assets/loginlogo.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      _getText('greeting'),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: _getText('username'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: _getText('password'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _onLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        _getText('connexion'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLanguageButton('en', 'EN', '🇬🇧'),
                      SizedBox(width: 16),
                      _buildLanguageButton('fr', 'FR', '🇫🇷'),
                      SizedBox(width: 16),
                      _buildLanguageButton('kh', 'KH', '🇰🇭'),
                    ],
                  ),
                  Spacer(),
                  SwitchListTile(
                    title: Text(_getText('darkMode')),
                    value: widget.isDarkMode,
                    onChanged: widget.onThemeChanged,
                    activeColor: Colors.orange,
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  ),
),
    );
  }

  Widget _buildLanguageButton(String code, String label, String flag) {
    bool isSelected = widget.selectedLanguage == code;
    return GestureDetector(
      onTap: () => widget.onLanguageChanged(code),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(flag, style: TextStyle(fontSize: 16)),
            SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
