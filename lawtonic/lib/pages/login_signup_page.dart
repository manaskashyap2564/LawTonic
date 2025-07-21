import 'package:flutter/material.dart';
import 'package:lawtonic/services/auth_service.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({super.key});

  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? 'Login' : 'Sign Up'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter an email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(val)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (val) =>
                    val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: Text(isLogin ? 'Login' : 'Sign Up'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = isLogin
                        ? await _auth.signInWithEmailAndPassword(email, password)
                        : await _auth.signUpWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() => error = 'Please supply a valid email');
                    } else {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  }
                },
              ),
              const SizedBox(height: 12.0),
              Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              TextButton(
                child: Text(isLogin
                    ? 'Create an account'
                    : 'I already have an account'),
                onPressed: () {
                  setState(() => isLogin = !isLogin);
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  dynamic result = await _auth.signInWithGoogle();
                  if (result != null) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                child: const Text('Sign in with Google'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
