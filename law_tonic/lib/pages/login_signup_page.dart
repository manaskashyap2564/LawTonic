import 'package:flutter/material.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({super.key});
  static const String routeName = '/login_signup';

  @override
  State<LoginSignupPage> createState() => _LoginSignupPageState();
}

enum AuthMode { login, signup }

class _LoginSignupPageState extends State<LoginSignupPage> {
  final _formKey = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.login;
  bool _isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController(); // For signup

  void _switchAuthMode() {
    setState(() {
      _authMode = _authMode == AuthMode.login ? AuthMode.signup : AuthMode.login;
      _formKey.currentState?.reset(); // Reset form validation on switch
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      _fullNameController.clear();
    });
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return; // Invalid
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    // Simulate authentication
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      final message = _authMode == AuthMode.login
          ? 'Login successful! (Simulated)'
          : 'Signup successful! Please check your email for verification. (Simulated)';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green[700],
        ),
      );
      // Potentially navigate away after successful auth
      // Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(_authMode == AuthMode.login ? 'Login' : 'Sign Up'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: deviceSize.width > 600 ? 500 : deviceSize.width * 0.9),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    _authMode == AuthMode.login ? 'Welcome Back!' : 'Create Your Account',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  if (_authMode == AuthMode.signup)
                    TextFormField(
                      controller: _fullNameController,
                      decoration: const InputDecoration(labelText: 'Full Name', prefixIcon: Icon(Icons.person_outline)),
                      validator: (value) {
                        if (_authMode == AuthMode.signup && (value == null || value.isEmpty)) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  if (_authMode == AuthMode.signup) const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock_outline)),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    textInputAction: _authMode == AuthMode.login ? TextInputAction.done : TextInputAction.next,
                  ),
                  if (_authMode == AuthMode.signup) const SizedBox(height: 16.0),
                  if (_authMode == AuthMode.signup)
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(labelText: 'Confirm Password', prefixIcon: Icon(Icons.lock_outline)),
                      obscureText: true,
                      validator: (value) {
                        if (_authMode == AuthMode.signup && value != _passwordController.text) {
                          return 'Passwords do not match!';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                    ),
                  const SizedBox(height: 32.0),
                  if (_isLoading)
                    const Center(child: CircularProgressIndicator())
                  else
                    ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16.0)),
                      child: Text(_authMode == AuthMode.login ? 'LOGIN' : 'SIGN UP'),
                    ),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: _isLoading ? null : _switchAuthMode,
                    child: Text(
                      _authMode == AuthMode.login
                          ? 'Don\'t have an account? Sign Up'
                          : 'Already have an account? Login',
                      style: TextStyle(color: theme.colorScheme.secondary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
