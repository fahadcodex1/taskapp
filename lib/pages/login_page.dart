import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskapp/pages/form_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _passwordError;
  bool isPasswordVisible = false;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validatePassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _passwordError = "Password cannot be empty";
        return;
      }

      final upperCaseCount = RegExp(r'[A-Z]').allMatches(value).length;
      final hasSpecialCharacter = RegExp(
        r'[!@#\$&*~`()_+\-=\[\]{};:"\\|,.<>/?]',
      ).hasMatch(value);

      if (value.length != 8) {
        _passwordError = "Password must be exactly 8 Characters long";
      } else if (upperCaseCount < 1 || upperCaseCount > 2) {
        _passwordError = "Must contain exactly 1 or 2 uppercase";
      } else if (!hasSpecialCharacter) {
        _passwordError = "Must contain one special character";
      } else {
        _passwordError = null;
      }
    });
  }

  void submitLogin() {
    final passwordText = _passwordController.text;

    if (passwordText.isEmpty) {
      setState(() => _passwordError = "Password cannot be empty");
      return;
    }

    if (_passwordError != null) {
      return;
    }

    if (_passwordError == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Authentication Successfull")),
      );
    }

    _userNameController.clear();
    _passwordController.clear();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Or Login
            const SizedBox(height: 70),
            Column(
              children: [
                FaIcon(
                  FontAwesomeIcons.circleUser,
                  size: 60,
                  color: Colors.blue,
                ),
                const SizedBox(height: 8),
                Text(
                  "login",
                  style: TextStyle(fontSize: 28, color: Colors.blue),
                ),
              ],
            ),

            // Username Textfield
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "Username",
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
            ),

            // Password Textfield
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: isPasswordVisible,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  errorText: _passwordError,
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                onChanged: _validatePassword,
              ),
            ),

            // Login Button
            const SizedBox(height: 50),
            SizedBox(
              height: 60,
              width: double.infinity,

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: submitLogin,

                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
