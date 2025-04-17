import 'package:flutter/material.dart';
import 'package:cinetimeapp/screen/signUpScreen.dart';

class signinscreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<signinscreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  // Hardcoded credentials
  final String demoEmail = "user@cinetime.com";
  final String demoPassword = "123456";

  void _handleSignIn() {
    final enteredEmail = _emailController.text;
    final enteredPassword = _passwordController.text;

    if (enteredEmail == demoEmail && enteredPassword == demoPassword) {
      // Simulate successful login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful!")),
      );
      // TODO: Navigate to Home or Dashboard
    } else {
      // Show error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid email or password.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo/logo.png', height: 80),
            SizedBox(height: 16),
            Text('CineTime',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Email',
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.w500)),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "example@email.com",
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Password',
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.w500)),
            ),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                hintText: "Your password",
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: _handleSignIn,
              child: Text("Sign in", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 12),
            TextButton(
              onPressed: () {},
              child: Text("Forgot Password?"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => signUpScreen()),
                    );
                  },
                  child: Text("Sign Up", style: TextStyle(color: Colors.red)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
